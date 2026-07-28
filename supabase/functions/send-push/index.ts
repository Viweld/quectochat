// Deno Edge Function: send FCM push when a new message is inserted.
// Deploy with: supabase functions deploy send-push
// Secrets: FCM_SERVICE_ACCOUNT_JSON (Firebase service account JSON)

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

Deno.serve(async (req) => {
  try {
    const payload = await req.json();
    const record = payload.record ?? payload;
    const toId = record.to_id as string | undefined;
    const content = (record.content as string | undefined) ?? 'New message';

    if (!toId) {
      return new Response(JSON.stringify({ ok: false, reason: 'missing to_id' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    );

    const { data: tokens, error } = await supabase
      .from('device_tokens')
      .select('token')
      .eq('user_id', toId);

    if (error) {
      throw error;
    }

    // FCM HTTP v1 delivery is intentionally stubbed until service-account wiring.
    // Replace this block with google-auth JWT + fcm.googleapis.com/v1/.../messages:send.
    console.log(
      JSON.stringify({
        event: 'send-push',
        toId,
        contentPreview: content.slice(0, 80),
        tokenCount: tokens?.length ?? 0,
      }),
    );

    return new Response(JSON.stringify({ ok: true, tokenCount: tokens?.length ?? 0 }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error(error);
    return new Response(JSON.stringify({ ok: false, error: String(error) }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
