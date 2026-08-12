-- security/user_creation.sql
-- Create an application user with least privilege.

CREATE USER api
LOGIN PASSWORD 'strong-secret'
IN ROLE app_write;
