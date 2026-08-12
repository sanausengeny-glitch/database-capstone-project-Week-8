-- security/roles_and_permissions.sql
-- Create roles and grant least-privilege permissions.

CREATE ROLE app_read NOLOGIN;
CREATE ROLE app_write NOLOGIN;

GRANT CONNECT ON DATABASE postgres TO app_read;
GRANT CONNECT ON DATABASE postgres TO app_write;

GRANT USAGE ON SCHEMA public TO app_read;
GRANT USAGE ON SCHEMA public TO app_write;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_read;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_write;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO app_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_write;
