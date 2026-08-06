-- Family islands, friendships, one-time invitations, display_name, visibility RLS.

-- ---------------------------------------------------------------------------
-- profiles: first_name/last_name -> display_name
-- ---------------------------------------------------------------------------

alter table public.profiles
  add column if not exists display_name text;

update public.profiles
set display_name = trim(both from coalesce(first_name, '') || ' ' || coalesce(last_name, ''))
where display_name is null or display_name = '';

update public.profiles
set display_name = 'User'
where display_name is null or display_name = '';

alter table public.profiles
  alter column display_name set not null;

alter table public.profiles
  drop column if exists first_name,
  drop column if exists last_name;

drop index if exists profiles_full_name_trgm_idx;

create index profiles_display_name_trgm_idx
  on public.profiles
  using gin (display_name gin_trgm_ops);

-- ---------------------------------------------------------------------------
-- Core graph tables
-- ---------------------------------------------------------------------------

create table public.families (
  id uuid primary key default gen_random_uuid(),
  created_by uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now()
);

create table public.family_members (
  family_id uuid not null references public.families (id) on delete cascade,
  user_id uuid not null references public.profiles (id) on delete cascade,
  role text not null check (role in ('parent', 'child')),
  created_at timestamptz not null default now(),
  primary key (family_id, user_id),
  unique (user_id)
);

create table public.friendships (
  id uuid primary key default gen_random_uuid(),
  family_id uuid not null references public.families (id) on delete cascade,
  host_user_id uuid not null references public.profiles (id) on delete cascade,
  friend_user_id uuid not null references public.profiles (id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (host_user_id, friend_user_id),
  unique (friend_user_id),
  check (host_user_id <> friend_user_id)
);

create table public.invitations (
  id uuid primary key default gen_random_uuid(),
  code text not null,
  family_id uuid references public.families (id) on delete cascade,
  inviter_id uuid references public.profiles (id) on delete set null,
  target_role text not null check (target_role in ('parent', 'child', 'friend')),
  creates_family boolean not null default false,
  expires_at timestamptz not null,
  used_at timestamptz,
  used_by uuid references public.profiles (id) on delete set null,
  revoked_at timestamptz,
  created_at timestamptz not null default now(),
  unique (code),
  check (
    (creates_family and family_id is null and target_role = 'parent')
    or (not creates_family and family_id is not null)
  )
);

create index invitations_code_idx on public.invitations (code);
create index friendships_host_user_id_idx on public.friendships (host_user_id);
create index friendships_friend_user_id_idx on public.friendships (friend_user_id);
create index family_members_family_id_idx on public.family_members (family_id);

alter table public.families enable row level security;
alter table public.family_members enable row level security;
alter table public.friendships enable row level security;
alter table public.invitations enable row level security;

-- ---------------------------------------------------------------------------
-- Visibility helpers
-- ---------------------------------------------------------------------------

create or replace function public.current_family_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select fm.family_id
  from public.family_members fm
  where fm.user_id = auth.uid()
  limit 1;
$$;

create or replace function public.current_family_role()
returns text
language sql
stable
security definer
set search_path = public
as $$
  select fm.role
  from public.family_members fm
  where fm.user_id = auth.uid()
  limit 1;
$$;

create or replace function public.current_friend_host_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select f.host_user_id
  from public.friendships f
  where f.friend_user_id = auth.uid()
  limit 1;
$$;

-- Viewer may see subject profile / open chat.
create or replace function public.is_visible_to(p_viewer uuid, p_subject uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select
    p_viewer = p_subject
    or exists (
      select 1
      from public.family_members a
      join public.family_members b on a.family_id = b.family_id
      where a.user_id = p_viewer and b.user_id = p_subject
    )
    or exists (
      select 1
      from public.friendships f
      where (f.host_user_id = p_viewer and f.friend_user_id = p_subject)
         or (f.host_user_id = p_subject and f.friend_user_id = p_viewer)
    )
    or exists (
      -- Family member sees friends of other relatives in the same family.
      select 1
      from public.family_members viewer_m
      join public.family_members host_m on viewer_m.family_id = host_m.family_id
      join public.friendships f on f.host_user_id = host_m.user_id
      where viewer_m.user_id = p_viewer
        and f.friend_user_id = p_subject
    )
    or exists (
      -- Friend sees relatives of their host (not friends of those relatives).
      select 1
      from public.friendships f
      join public.family_members host_m on host_m.user_id = f.host_user_id
      join public.family_members relative_m on relative_m.family_id = host_m.family_id
      where f.friend_user_id = p_viewer
        and relative_m.user_id = p_subject
    )
    or exists (
      -- Friend sees other friends of the same host.
      select 1
      from public.friendships mine
      join public.friendships peer on peer.host_user_id = mine.host_user_id
      where mine.friend_user_id = p_viewer
        and peer.friend_user_id = p_subject
    );
$$;

create or replace function public.can_message(p_from uuid, p_to uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select public.is_visible_to(p_from, p_to) and p_from <> p_to;
$$;

-- ---------------------------------------------------------------------------
-- Invitation code helpers
-- ---------------------------------------------------------------------------

create or replace function public.generate_invite_code()
returns text
language plpgsql
security definer
set search_path = public
as $$
declare
  alphabet text := 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  result text;
  i int;
begin
  loop
    result := '';
    for i in 1..8 loop
      result := result || substr(alphabet, 1 + floor(random() * length(alphabet))::int, 1);
    end loop;
    exit when not exists (select 1 from public.invitations where code = result);
  end loop;
  return result;
end;
$$;

create or replace function public.create_invitation(p_target_role text)
returns table (
  id uuid,
  code text,
  target_role text,
  expires_at timestamptz
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_role text;
  v_family_id uuid;
  v_code text;
  v_expires timestamptz := now() + interval '7 days';
  v_id uuid;
begin
  if auth.uid() is null then
    raise exception 'not authenticated';
  end if;

  if p_target_role not in ('parent', 'child', 'friend') then
    raise exception 'invalid target role';
  end if;

  select fm.role, fm.family_id into v_role, v_family_id
  from public.family_members fm
  where fm.user_id = auth.uid();

  if v_family_id is null then
    raise exception 'only family members can create invitations';
  end if;

  if v_role = 'child' and p_target_role <> 'friend' then
    raise exception 'child may invite friends only';
  end if;

  if v_role <> 'parent' and v_role <> 'child' then
    raise exception 'invalid member role';
  end if;

  v_code := public.generate_invite_code();
  insert into public.invitations (
    code, family_id, inviter_id, target_role, creates_family, expires_at
  ) values (
    v_code, v_family_id, auth.uid(), p_target_role, false, v_expires
  )
  returning invitations.id into v_id;

  return query
  select v_id, v_code, p_target_role, v_expires;
end;
$$;

-- Guest-safe validation: no PII, only status + role hints.
create or replace function public.validate_invitation(p_code text)
returns table (
  is_valid boolean,
  failure_reason text,
  target_role text,
  creates_family boolean,
  expires_at timestamptz
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_inv public.invitations%rowtype;
  v_normalized text := upper(regexp_replace(coalesce(p_code, ''), '[^A-Za-z0-9]', '', 'g'));
begin
  if length(v_normalized) <> 8 then
    return query select false, 'invalid_format', null::text, false, null::timestamptz;
    return;
  end if;

  select * into v_inv from public.invitations where code = v_normalized;

  if not found then
    return query select false, 'not_found', null::text, false, null::timestamptz;
    return;
  end if;

  if v_inv.revoked_at is not null then
    return query select false, 'revoked', v_inv.target_role, v_inv.creates_family, v_inv.expires_at;
    return;
  end if;

  if v_inv.used_at is not null then
    return query select false, 'used', v_inv.target_role, v_inv.creates_family, v_inv.expires_at;
    return;
  end if;

  if v_inv.expires_at <= now() then
    return query select false, 'expired', v_inv.target_role, v_inv.creates_family, v_inv.expires_at;
    return;
  end if;

  return query select true, null::text, v_inv.target_role, v_inv.creates_family, v_inv.expires_at;
end;
$$;

create or replace function public.redeem_invitation(p_code text)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_inv public.invitations%rowtype;
  v_normalized text := upper(regexp_replace(coalesce(p_code, ''), '[^A-Za-z0-9]', '', 'g'));
  v_family_id uuid;
begin
  if auth.uid() is null then
    raise exception 'not authenticated';
  end if;

  if exists (
    select 1 from public.family_members where user_id = auth.uid()
  ) or exists (
    select 1 from public.friendships where friend_user_id = auth.uid()
  ) then
    -- Idempotent: already redeemed into graph.
    return;
  end if;

  select * into v_inv
  from public.invitations
  where code = v_normalized
  for update;

  if not found then
    raise exception 'invitation not found';
  end if;

  if v_inv.revoked_at is not null then
    raise exception 'invitation revoked';
  end if;

  if v_inv.used_at is not null then
    raise exception 'invitation already used';
  end if;

  if v_inv.expires_at <= now() then
    raise exception 'invitation expired';
  end if;

  if v_inv.creates_family then
    insert into public.families (created_by)
    values (auth.uid())
    returning id into v_family_id;

    insert into public.family_members (family_id, user_id, role)
    values (v_family_id, auth.uid(), 'parent');
  elsif v_inv.target_role in ('parent', 'child') then
    insert into public.family_members (family_id, user_id, role)
    values (v_inv.family_id, auth.uid(), v_inv.target_role);
  elsif v_inv.target_role = 'friend' then
    if v_inv.inviter_id is null then
      raise exception 'friend invitation missing inviter';
    end if;
    insert into public.friendships (family_id, host_user_id, friend_user_id)
    values (v_inv.family_id, v_inv.inviter_id, auth.uid());
  else
    raise exception 'unsupported target role';
  end if;

  update public.invitations
  set used_at = now(), used_by = auth.uid()
  where id = v_inv.id;
end;
$$;

-- ---------------------------------------------------------------------------
-- Home feed / nested contacts
-- ---------------------------------------------------------------------------

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
      -- Family member opens friends of a relative.
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
      -- Friend opens relatives of their host.
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

-- Current user profile + role for drawer permissions.
create or replace function public.get_current_user_profile()
returns table (
  user_id uuid,
  display_name text,
  family_role text,
  inviter_id uuid,
  family_id uuid
)
language sql
stable
security definer
set search_path = public
as $$
  select
    p.id,
    p.display_name,
    fm.role,
    f.host_user_id,
    coalesce(fm.family_id, f.family_id)
  from public.profiles p
  left join public.family_members fm on fm.user_id = p.id
  left join public.friendships f on f.friend_user_id = p.id
  where p.id = auth.uid();
$$;

-- ---------------------------------------------------------------------------
-- Replace get_conversations to use display_name (kept for compatibility)
-- OUT columns changed (first_name/last_name -> display_name): must DROP first.
-- ---------------------------------------------------------------------------

drop function if exists public.get_conversations(int, int);

create or replace function public.get_conversations(
  p_limit int default 20,
  p_offset int default 0
)
returns table (
  partner_id uuid,
  display_name text,
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
    p.display_name,
    l.last_content,
    l.last_type,
    l.last_created_at,
    l.last_from_id
  from latest l
  join public.profiles p on p.id = l.partner_id
  where public.is_visible_to(auth.uid(), l.partner_id)
  order by l.last_created_at desc nulls last
  limit greatest(p_limit, 0)
  offset greatest(p_offset, 0);
$$;

-- ---------------------------------------------------------------------------
-- RLS policies
-- ---------------------------------------------------------------------------

drop policy if exists "profiles readable by authenticated" on public.profiles;

create policy "profiles readable if visible"
  on public.profiles for select to authenticated
  using (public.is_visible_to(auth.uid(), id));

drop policy if exists "send as self" on public.messages;

create policy "send as self to visible"
  on public.messages for insert to authenticated
  with check (
    from_id = auth.uid()
    and public.can_message(auth.uid(), to_id)
  );

create policy "families readable by members and friends"
  on public.families for select to authenticated
  using (
    exists (
      select 1 from public.family_members fm
      where fm.family_id = id and fm.user_id = auth.uid()
    )
    or exists (
      select 1 from public.friendships f
      where f.family_id = id and f.friend_user_id = auth.uid()
    )
  );

create policy "family members readable in same family or by friends of host"
  on public.family_members for select to authenticated
  using (
    user_id = auth.uid()
    or family_id = public.current_family_id()
    or exists (
      select 1
      from public.friendships f
      join public.family_members host_m on host_m.user_id = f.host_user_id
      where f.friend_user_id = auth.uid()
        and host_m.family_id = family_members.family_id
    )
  );

create policy "friendships readable to involved and family peers"
  on public.friendships for select to authenticated
  using (
    host_user_id = auth.uid()
    or friend_user_id = auth.uid()
    or family_id = public.current_family_id()
  );

-- Invitations: creator can read own active invites (for share screen refresh).
create policy "inviter can read own invitations"
  on public.invitations for select to authenticated
  using (inviter_id = auth.uid() or creates_family);

-- ---------------------------------------------------------------------------
-- Grants
-- ---------------------------------------------------------------------------

grant select on table public.families to authenticated;
grant select on table public.family_members to authenticated;
grant select on table public.friendships to authenticated;
grant select on table public.invitations to authenticated;

grant execute on function public.is_visible_to(uuid, uuid) to authenticated;
grant execute on function public.can_message(uuid, uuid) to authenticated;
grant execute on function public.current_family_id() to authenticated;
grant execute on function public.current_family_role() to authenticated;
grant execute on function public.current_friend_host_id() to authenticated;
grant execute on function public.create_invitation(text) to authenticated;
grant execute on function public.validate_invitation(text) to anon, authenticated;
grant execute on function public.redeem_invitation(text) to authenticated;
grant execute on function public.get_home_feed() to authenticated;
grant execute on function public.get_nested_contacts(uuid) to authenticated;
grant execute on function public.get_current_user_profile() to authenticated;
grant execute on function public.get_conversations(int, int) to authenticated;

-- ---------------------------------------------------------------------------
-- Bootstrap example (operator): create a one-time founder invite.
-- Replace CODE manually or call generate_invite_code() in SQL editor:
--
-- insert into public.invitations (
--   code, family_id, inviter_id, target_role, creates_family, expires_at
-- ) values (
--   '7MFKRQ3P', null, null, 'parent', true, now() + interval '30 days'
-- );
-- ---------------------------------------------------------------------------
