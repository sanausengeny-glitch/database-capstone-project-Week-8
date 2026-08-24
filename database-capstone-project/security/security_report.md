# Security Report

- [x] Least-privilege roles implemented
- [x] No application uses a superuser account
- [x] RLS enabled on sensitive tables
- [x] Audit logging enabled
- [x] Sensitive fields hashed/encrypted
- [x] Parameterized queries documented
- [x] Backups tested successfully

## Design Summary
The application uses dedicated roles for read-only, read-write, and application access. Data is isolated through RLS based on the active organization context, while audit tables record change events for governance review.

## Sensitive field handling
Passwords are stored as hashed values and should be generated using bcrypt or Argon2 before insertion to keep plain-text credentials out of the database.

## Parameterized queries
Application code should use parameterized SQL or prepared statements such as SELECT * FROM users WHERE email = $1.

## Backup verification
Restore procedures and validation are documented in backups/backup_verification.md.
