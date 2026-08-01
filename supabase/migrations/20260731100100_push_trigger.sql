-- Invoke Edge Function send-push after each new message.
-- Prerequisites (run once in SQL Editor, do not commit secrets):
--   select vault.create_secret('<PUSH_WEBHOOK_SECRET>', 'push_webhook_secret');
--   select vault.create_secret(
--     'https://<PROJECT_REF>.supabase.co/functions/v1/send-push',
--     'send_push_url'
--   );

create extension if not exists pg_net with schema extensions;

create or replace function public.notify_new_message()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  webhook_secret text;
  send_push_url text;
begin
  select decrypted_secret into webhook_secret
  from vault.decrypted_secrets
  where name = 'push_webhook_secret'
  limit 1;

  select decrypted_secret into send_push_url
  from vault.decrypted_secrets
  where name = 'send_push_url'
  limit 1;

  if webhook_secret is null or send_push_url is null then
    raise warning 'notify_new_message: missing vault secrets push_webhook_secret / send_push_url';
    return new;
  end if;

  perform net.http_post(
    url := send_push_url,
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'x-webhook-secret', webhook_secret
    ),
    body := jsonb_build_object('record', row_to_json(new))
  );

  return new;
end;
$$;

drop trigger if exists messages_after_insert_send_push on public.messages;

create trigger messages_after_insert_send_push
  after insert on public.messages
  for each row
  execute function public.notify_new_message();
