-- Security Advisor hardening (WARN):
-- 0014 extension_in_public (pg_trgm)
-- 0025 public_bucket_allows_listing (chat-media SELECT)
-- 0028/0029 SECURITY DEFINER RPC exposure (notify_new_message, rls_auto_enable)

-- 1) Move pg_trgm out of the exposed `public` schema.
create schema if not exists extensions;

do $$
begin
  if exists (
    select 1
    from pg_extension e
    join pg_namespace n on n.oid = e.extnamespace
    where e.extname = 'pg_trgm'
      and n.nspname = 'public'
  ) then
    alter extension pg_trgm set schema extensions;
  end if;
end $$;

-- 2) Public buckets are reachable by object URL without a broad SELECT policy.
--    Dropping this stops clients from listing every object in `chat-media`.
drop policy if exists "chat media public read" on storage.objects;

-- 3) Trigger / maintenance SECURITY DEFINER functions must not be callable via RPC.
revoke execute on function public.notify_new_message() from public;
revoke execute on function public.notify_new_message() from anon, authenticated;

do $$
begin
  if to_regprocedure('public.rls_auto_enable()') is not null then
    execute 'revoke execute on function public.rls_auto_enable() from public';
    execute 'revoke execute on function public.rls_auto_enable() from anon, authenticated';
  end if;
end $$;
