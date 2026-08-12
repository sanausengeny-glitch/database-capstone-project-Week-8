# Migration Report

## Migration Files Created

- `migrations/V1__core_tables.sql`
- `migrations/V2__audit_log.sql`
- `migrations/V3__categories.sql`

## Flyway Execution

Run the following commands to apply and verify migrations:

```bash
flyway -url=jdbc:postgresql://localhost/bootcamp -user=postgres migrate
flyway -url=jdbc:postgresql://localhost/bootcamp -user=postgres info
```

## Expected Output

- `flyway migrate` should show migrations `V1`, `V2`, and `V3` applied successfully.
- `flyway info` should list each migration with status `Success` and execution order 1, 2, 3.

## Order of Execution

1. `V1__core_tables.sql`
2. `V2__audit_log.sql`
3. `V3__categories.sql`

## Why Migrations Are Preferred

Versioned migrations provide a reproducible and auditable way to evolve database schemas. They ensure that all environments (development, staging, production) apply the same ordered changes and allow teams to track schema history, recover from errors, and avoid manual drift.