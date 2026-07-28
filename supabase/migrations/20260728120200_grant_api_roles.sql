-- Expose tables/RPC to PostgREST roles (needed when "Automatically expose new tables" is off).

grant usage on schema public to anon, authenticated;

grant select, insert, update on table public.profiles to authenticated;
grant select on table public.profiles to anon;

grant select, insert, update, delete on table public.messages to authenticated;
grant select, insert, update, delete on table public.device_tokens to authenticated;

grant execute on function public.get_conversations(int, int) to authenticated;

grant usage, select on all sequences in schema public to anon, authenticated;
