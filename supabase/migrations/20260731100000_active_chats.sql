-- Tracks which chat is currently open on a device (used to suppress duplicate push).
create table public.active_chats (
  user_id uuid not null references public.profiles (id) on delete cascade,
  interlocutor_id uuid not null references public.profiles (id) on delete cascade,
  updated_at timestamptz not null default now(),
  primary key (user_id, interlocutor_id)
);

create index active_chats_updated_at_idx
  on public.active_chats (updated_at);

alter table public.active_chats enable row level security;

create policy "own active chats readable"
  on public.active_chats for select to authenticated
  using (user_id = auth.uid());

create policy "own active chats writable"
  on public.active_chats for insert to authenticated
  with check (user_id = auth.uid());

create policy "own active chats updatable"
  on public.active_chats for update to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy "own active chats deletable"
  on public.active_chats for delete to authenticated
  using (user_id = auth.uid());

grant select, insert, update, delete on table public.active_chats to authenticated;
