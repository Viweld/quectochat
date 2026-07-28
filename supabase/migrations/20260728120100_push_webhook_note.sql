-- Optional: invoke Edge Function send-push on new messages (requires pg_net).
-- Enable Database Webhooks in Supabase Dashboard pointing to send-push if pg_net is unavailable.

-- Example webhook payload shape expected by send-push:
-- { "record": { "to_id": "...", "content": "...", "from_id": "..." } }
