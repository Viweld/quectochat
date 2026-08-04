-- Private chat media bucket for image messages (camera / gallery).
-- Keep files small on the client; Free plan Storage is limited.

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'chat-media',
  'chat-media',
  true,
  2097152,
  array['image/jpeg', 'image/jpg', 'image/png', 'image/webp']
)
on conflict (id) do update set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

create policy "chat media authenticated upload"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'chat-media');

create policy "chat media public read"
  on storage.objects for select to public
  using (bucket_id = 'chat-media');

create policy "chat media owner delete"
  on storage.objects for delete to authenticated
  using (bucket_id = 'chat-media' and owner = auth.uid());
