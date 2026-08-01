// Deno Edge Function: send FCM push when a new message is inserted.
// Deploy: supabase functions deploy send-push --no-verify-jwt
// Secrets: FCM_SERVICE_ACCOUNT_JSON, PUSH_WEBHOOK_SECRET

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { SignJWT, importPKCS8 } from 'https://deno.land/x/jose@v5.9.3/index.ts';

const ACTIVE_CHAT_TTL_MS = 20_000;

type ServiceAccount = {
  project_id: string;
  client_email: string;
  private_key: string;
};

type MessageRecord = {
  id?: string;
  chat_id?: string;
  from_id?: string;
  to_id?: string;
  content?: string;
  type?: string;
};

Deno.serve(async (req) => {
  try {
    const expectedSecret = Deno.env.get('PUSH_WEBHOOK_SECRET');
    const providedSecret = req.headers.get('x-webhook-secret');
    if (!expectedSecret || providedSecret !== expectedSecret) {
      return jsonResponse({ ok: false, reason: 'unauthorized' }, 401);
    }

    const payload = await req.json();
    const record = (payload.record ?? payload) as MessageRecord;
    const toId = record.to_id;
    const fromId = record.from_id;
    const content = record.content ?? 'New message';
    const messageType = record.type ?? 'text';
    const chatId = record.chat_id ?? '';

    if (!toId || !fromId) {
      return jsonResponse({ ok: false, reason: 'missing to_id/from_id' }, 400);
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    const { data: activeChat } = await supabase
      .from('active_chats')
      .select('updated_at')
      .eq('user_id', toId)
      .eq('interlocutor_id', fromId)
      .maybeSingle();

    if (activeChat?.updated_at) {
      const updatedAtMs = Date.parse(activeChat.updated_at as string);
      if (!Number.isNaN(updatedAtMs) && Date.now() - updatedAtMs < ACTIVE_CHAT_TTL_MS) {
        return jsonResponse({ ok: true, skipped: 'active_chat' });
      }
    }

    const { data: tokens, error: tokensError } = await supabase
      .from('device_tokens')
      .select('token')
      .eq('user_id', toId);

    if (tokensError) throw tokensError;

    const tokenList = (tokens ?? [])
      .map((row) => row.token as string)
      .filter((token) => token.length > 0);

    if (tokenList.length === 0) {
      return jsonResponse({ ok: true, tokenCount: 0 });
    }

    const { data: sender } = await supabase
      .from('profiles')
      .select('first_name, last_name')
      .eq('id', fromId)
      .maybeSingle();

    const title = sender
      ? `${sender.first_name ?? ''} ${sender.last_name ?? ''}`.trim() || 'QuectoChat'
      : 'QuectoChat';
    const body = messageType === 'image' ? '📷 Photo' : content.slice(0, 180);

    const { count: unreadCount } = await supabase
      .from('messages')
      .select('id', { count: 'exact', head: true })
      .eq('to_id', toId)
      .is('read_at', null);

    const badge = unreadCount ?? 0;
    const serviceAccount = parseServiceAccount();
    const accessToken = await getAccessToken(serviceAccount);

    let sent = 0;
    const invalidTokens: string[] = [];

    for (const token of tokenList) {
      const result = await sendFcmMessage({
        accessToken,
        projectId: serviceAccount.project_id,
        token,
        title,
        body,
        badge,
        data: {
          chatId,
          fromId,
          type: messageType,
          unreadCount: String(badge),
        },
      });

      if (result.ok) {
        sent += 1;
      } else if (result.unregister) {
        invalidTokens.push(token);
      }
    }

    if (invalidTokens.length > 0) {
      await supabase.from('device_tokens').delete().eq('user_id', toId).in('token', invalidTokens);
    }

    return jsonResponse({
      ok: true,
      tokenCount: tokenList.length,
      sent,
      removedInvalid: invalidTokens.length,
    });
  } catch (error) {
    console.error(error);
    return jsonResponse({ ok: false, error: String(error) }, 500);
  }
});

function parseServiceAccount(): ServiceAccount {
  const raw = Deno.env.get('FCM_SERVICE_ACCOUNT_JSON');
  if (!raw) {
    throw new Error('Missing FCM_SERVICE_ACCOUNT_JSON secret');
  }
  return JSON.parse(raw) as ServiceAccount;
}

async function getAccessToken(serviceAccount: ServiceAccount): Promise<string> {
  const privateKey = await importPKCS8(serviceAccount.private_key, 'RS256');
  const now = Math.floor(Date.now() / 1000);
  const jwt = await new SignJWT({
    scope: 'https://www.googleapis.com/auth/firebase.messaging',
  })
    .setProtectedHeader({ alg: 'RS256' })
    .setIssuer(serviceAccount.client_email)
    .setAudience('https://oauth2.googleapis.com/token')
    .setIssuedAt(now)
    .setExpirationTime(now + 3600)
    .sign(privateKey);

  const response = await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      assertion: jwt,
    }),
  });

  if (!response.ok) {
    throw new Error(`Failed to obtain FCM access token: ${await response.text()}`);
  }

  const json = await response.json();
  return json.access_token as string;
}

async function sendFcmMessage(args: {
  accessToken: string;
  projectId: string;
  token: string;
  title: string;
  body: string;
  badge: number;
  data: Record<string, string>;
}): Promise<{ ok: boolean; unregister: boolean }> {
  const response = await fetch(
    `https://fcm.googleapis.com/v1/projects/${args.projectId}/messages:send`,
    {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${args.accessToken}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        message: {
          token: args.token,
          notification: {
            title: args.title,
            body: args.body,
          },
          data: args.data,
          android: {
            priority: 'HIGH',
            notification: {
              channel_id: 'messages',
              sound: 'default',
            },
          },
          apns: {
            payload: {
              aps: {
                badge: args.badge,
                sound: 'default',
              },
            },
          },
        },
      }),
    },
  );

  if (response.ok) {
    return { ok: true, unregister: false };
  }

  const errorText = await response.text();
  console.error(JSON.stringify({ event: 'fcm-send-failed', status: response.status, errorText }));

  const unregister =
    errorText.includes('UNREGISTERED') ||
    errorText.includes('NOT_FOUND') ||
    errorText.includes('INVALID_ARGUMENT');

  return { ok: false, unregister };
}

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
