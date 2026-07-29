-- Replace binary is_viewed with delivered_at / read_at timestamps.
alter table public.messages add column delivered_at timestamptz;
alter table public.messages add column read_at timestamptz;

update public.messages
set
  delivered_at = created_at,
  read_at = created_at
where is_viewed;

drop index if exists messages_to_id_unread_idx;
alter table public.messages drop column is_viewed;

create index messages_to_id_unread_idx
  on public.messages (to_id)
  where read_at is null;
