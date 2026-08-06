-- Hotfix: get_home_feed / get_nested_contacts used dropped column is_viewed
-- (replaced by read_at in 20260729144000_message_delivery_status.sql).
-- Also wrap UNION ORDER BY to avoid PL/pgSQL OUT-param name clash.

create or replace function public.get_home_feed()
returns table (
  user_id uuid,
  display_name text,
  section text,
  is_pinned boolean,
  nested_unread_contact_count int,
  last_content text,
  last_type text,
  last_created_at timestamptz,
  last_from_id uuid
)
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_family_id uuid;
  v_host_id uuid;
begin
  if v_uid is null then
    raise exception 'not authenticated';
  end if;

  select fm.family_id into v_family_id
  from public.family_members fm
  where fm.user_id = v_uid;

  select f.host_user_id into v_host_id
  from public.friendships f
  where f.friend_user_id = v_uid;

  return query
  with last_messages as (
    select distinct on (partner_id)
      partner_id,
      content as last_content,
      type as last_type,
      created_at as last_created_at,
      from_id as last_from_id
    from (
      select
        case when m.from_id = v_uid then m.to_id else m.from_id end as partner_id,
        m.content,
        m.type,
        m.created_at,
        m.from_id
      from public.messages m
      where m.from_id = v_uid or m.to_id = v_uid
    ) my
    order by partner_id, created_at desc
  ),
  family_peers as (
    select
      p.id as user_id,
      p.display_name,
      'pinned'::text as section,
      true as is_pinned,
      (
        select count(distinct f.friend_user_id)::int
        from public.friendships f
        join public.messages m
          on m.from_id = f.friend_user_id
         and m.to_id = v_uid
         and m.read_at is null
        where f.host_user_id = p.id
          and f.family_id = v_family_id
      ) as nested_unread_contact_count,
      lm.last_content,
      lm.last_type,
      lm.last_created_at,
      lm.last_from_id
    from public.family_members fm
    join public.profiles p on p.id = fm.user_id
    left join last_messages lm on lm.partner_id = p.id
    where v_family_id is not null
      and fm.family_id = v_family_id
      and fm.user_id <> v_uid
  ),
  my_friends as (
    select
      p.id as user_id,
      p.display_name,
      'contacts'::text as section,
      false as is_pinned,
      0 as nested_unread_contact_count,
      lm.last_content,
      lm.last_type,
      lm.last_created_at,
      lm.last_from_id
    from public.friendships f
    join public.profiles p on p.id = f.friend_user_id
    left join last_messages lm on lm.partner_id = p.id
    where v_family_id is not null
      and f.host_user_id = v_uid
  ),
  friend_host as (
    select
      p.id as user_id,
      p.display_name,
      'pinned'::text as section,
      true as is_pinned,
      (
        select count(distinct rm.user_id)::int
        from public.family_members host_m
        join public.family_members rm
          on rm.family_id = host_m.family_id
         and rm.user_id <> host_m.user_id
        join public.messages m
          on m.from_id = rm.user_id
         and m.to_id = v_uid
         and m.read_at is null
        where host_m.user_id = p.id
      ) as nested_unread_contact_count,
      lm.last_content,
      lm.last_type,
      lm.last_created_at,
      lm.last_from_id
    from public.profiles p
    left join last_messages lm on lm.partner_id = p.id
    where v_host_id is not null
      and p.id = v_host_id
  ),
  peer_friends as (
    select
      p.id as user_id,
      p.display_name,
      'contacts'::text as section,
      false as is_pinned,
      0 as nested_unread_contact_count,
      lm.last_content,
      lm.last_type,
      lm.last_created_at,
      lm.last_from_id
    from public.friendships mine
    join public.friendships peer
      on peer.host_user_id = mine.host_user_id
     and peer.friend_user_id <> mine.friend_user_id
    join public.profiles p on p.id = peer.friend_user_id
    left join last_messages lm on lm.partner_id = p.id
    where v_host_id is not null
      and mine.friend_user_id = v_uid
  )
  select * from (
    select * from family_peers
    union all
    select * from my_friends
    union all
    select * from friend_host
    union all
    select * from peer_friends
  ) feed
  order by feed.is_pinned desc, feed.last_created_at desc nulls last, feed.display_name;
end;
$$;

create or replace function public.get_nested_contacts(p_anchor_user_id uuid)
returns table (
  user_id uuid,
  display_name text,
  last_content text,
  last_type text,
  last_created_at timestamptz,
  last_from_id uuid,
  has_unread boolean
)
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_family_id uuid;
  v_host_id uuid;
begin
  if v_uid is null then
    raise exception 'not authenticated';
  end if;

  select fm.family_id into v_family_id
  from public.family_members fm
  where fm.user_id = v_uid;

  select f.host_user_id into v_host_id
  from public.friendships f
  where f.friend_user_id = v_uid;

  return query
  with last_messages as (
    select distinct on (partner_id)
      partner_id,
      content as last_content,
      type as last_type,
      created_at as last_created_at,
      from_id as last_from_id
    from (
      select
        case when m.from_id = v_uid then m.to_id else m.from_id end as partner_id,
        m.content,
        m.type,
        m.created_at,
        m.from_id
      from public.messages m
      where m.from_id = v_uid or m.to_id = v_uid
    ) my
    order by partner_id, created_at desc
  )
  select
    p.id,
    p.display_name,
    lm.last_content,
    lm.last_type,
    lm.last_created_at,
    lm.last_from_id,
    exists (
      select 1
      from public.messages m
      where m.from_id = p.id
        and m.to_id = v_uid
        and m.read_at is null
    ) as has_unread
  from public.profiles p
  left join last_messages lm on lm.partner_id = p.id
  where
    (
      v_family_id is not null
      and exists (
        select 1
        from public.family_members anchor
        where anchor.family_id = v_family_id
          and anchor.user_id = p_anchor_user_id
      )
      and exists (
        select 1
        from public.friendships f
        where f.host_user_id = p_anchor_user_id
          and f.friend_user_id = p.id
      )
    )
    or (
      v_host_id is not null
      and p_anchor_user_id = v_host_id
      and exists (
        select 1
        from public.family_members host_m
        join public.family_members relative_m
          on relative_m.family_id = host_m.family_id
        where host_m.user_id = v_host_id
          and relative_m.user_id = p.id
          and relative_m.user_id <> v_host_id
      )
    )
  order by lm.last_created_at desc nulls last, p.display_name;
end;
$$;

grant execute on function public.get_home_feed() to authenticated;
grant execute on function public.get_nested_contacts(uuid) to authenticated;
