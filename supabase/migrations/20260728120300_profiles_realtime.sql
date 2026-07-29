-- Enable Realtime for profiles so home directory updates when users register.
alter publication supabase_realtime add table public.profiles;
