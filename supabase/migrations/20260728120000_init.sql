-- QuectoChat initial schema: profiles, messages, device_tokens, RLS, RPC.

create extension if not exists pg_trgm;

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  first_name text not null,
  last_name text not null,
  created_at timestamptz not null default now()
);

create table public.messages (
  id uuid primary key default gen_random_uuid(),
  chat_id text not null,
  from_id uuid not null references public.profiles (id) on delete cascade,
  to_id uuid not null references public.profiles (id) on delete cascade,
  content text not null,
  type text not null check (type in ('text', 'image')),
  is_viewed boolean not null default false,
  created_at timestamptz not null default now()
);

create table public.device_tokens (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles (id) on delete cascade,
  token text not null,
  platform text not null check (platform in ('android', 'ios')),
  updated_at timestamptz not null default now(),
  unique (user_id, token)
);

create index messages_chat_id_created_at_idx
  on public.messages (chat_id, created_at desc);

create index messages_to_id_unread_idx
  on public.messages (to_id)
  where not is_viewed;

create index profiles_full_name_trgm_idx
  on public.profiles
  using gin ((first_name || ' ' || last_name) gin_trgm_ops);

alter table public.profiles enable row level security;
alter table public.messages enable row level security;
alter table public.device_tokens enable row level security;

create policy "profiles readable by authenticated"
  on public.profiles for select to authenticated
  using (true);

create policy "own profile insert"
  on public.profiles for insert to authenticated
  with check (id = auth.uid());

create policy "own profile update"
  on public.profiles for update to authenticated
  using (id = auth.uid())
  with check (id = auth.uid());

create policy "own messages readable"
  on public.messages for select to authenticated
  using (from_id = auth.uid() or to_id = auth.uid());

create policy "send as self"
  on public.messages for insert to authenticated
  with check (from_id = auth.uid());

create policy "recipient can mark viewed"
  on public.messages for update to authenticated
  using (to_id = auth.uid())
  with check (to_id = auth.uid());

create policy "participants can delete chat messages"
  on public.messages for delete to authenticated
  using (from_id = auth.uid() or to_id = auth.uid());

create policy "own device tokens readable"
  on public.device_tokens for select to authenticated
  using (user_id = auth.uid());

create policy "own device tokens writable"
  on public.device_tokens for insert to authenticated
  with check (user_id = auth.uid());

create policy "own device tokens updatable"
  on public.device_tokens for update to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy "own device tokens deletable"
  on public.device_tokens for delete to authenticated
  using (user_id = auth.uid());

create or replace function public.get_conversations(
  p_limit int default 20,
  p_offset int default 0
)
returns table (
  partner_id uuid,
  first_name text,
  last_name text,
  last_content text,
  last_type text,
  last_created_at timestamptz,
  last_from_id uuid
)
language sql
security invoker
set search_path = public
as $$
  with my_messages as (
    select
      case
        when m.from_id = auth.uid() then m.to_id
        else m.from_id
      end as partner_id,
      m.content,
      m.type,
      m.created_at,
      m.from_id
    from public.messages m
    where m.from_id = auth.uid() or m.to_id = auth.uid()
  ),
  latest as (
    select distinct on (partner_id)
      partner_id,
      content as last_content,
      type as last_type,
      created_at as last_created_at,
      from_id as last_from_id
    from my_messages
    order by partner_id, created_at desc
  )
  select
    l.partner_id,
    p.first_name,
    p.last_name,
    l.last_content,
    l.last_type,
    l.last_created_at,
    l.last_from_id
  from latest l
  join public.profiles p on p.id = l.partner_id
  order by l.last_created_at desc nulls last
  limit greatest(p_limit, 0)
  offset greatest(p_offset, 0);
$$;

alter publication supabase_realtime add table public.messages;
