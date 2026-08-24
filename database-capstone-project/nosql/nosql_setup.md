# NoSQL Setup Notes

## Technologies used
- Redis 7+
- MongoDB 7+

## Commands executed
```bash
redis-server --daemonize yes
mongod --dbpath /data/db --fork
```

## Configuration applied
- Redis handles sessions and cache lookups.
- MongoDB handles activity and event logs.
- TTL policies are applied to ephemeral data.
- The app layer is responsible for cache invalidation and event cleanup.
