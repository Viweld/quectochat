-- Edge Function send-push uses the service_role key and needs table access.
grant select, delete on table public.device_tokens to service_role;
grant select on table public.profiles to service_role;
grant select on table public.messages to service_role;
grant select on table public.active_chats to service_role;
