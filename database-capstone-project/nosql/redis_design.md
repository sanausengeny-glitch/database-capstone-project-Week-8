# Redis Design for CampusLearn

## What data is stored
Redis stores session tokens, active user states, and frequently accessed cache entries for course lists and dashboard summaries.

## Why Redis was selected
Redis has extremely low latency and is ideal for high-speed reads and ephemeral state. It reduces load on PostgreSQL for repeated read-heavy patterns.

## Benefits provided
- faster session validation
- reduced dashboard latency
- simple invalidation after course or enrollment updates
- support for rate limiting and temporary quotas
