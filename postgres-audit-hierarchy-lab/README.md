# Postgres Audit Hierarchy Lab

## Project Overview

This project demonstrates production-ready PostgreSQL practices including audit logging, hierarchical data modeling, Flyway migrations, and least-privilege security.

## Objectives

- Build an audit log using triggers and JSONB row snapshots
- Model a category hierarchy with self-referencing parent rows
- Create versioned database migrations with Flyway
- Implement least-privilege roles and application user access

## Repository Structure

- `migrations/` - Flyway migration scripts for schema setup
- `audit/` - Audit trigger setup, test script, and results
- `hierarchy/` - Category table, recursive query, and hierarchy documentation
- `security/` - Roles, user creation, and security notes
- `docs/` - Reports and design explanations

## Migration Workflow

1. Place migration files in `migrations/`
2. Run `flyway -url=jdbc:postgresql://localhost/bootcamp -user=postgres migrate`
3. Run `flyway -url=jdbc:postgresql://localhost/bootcamp -user=postgres info`

## Audit Logging Workflow

- `audit/audit_trigger.sql` creates `audit_log`, the `audit()` function, and `trg_audit` on `students`.
- `audit/audit_test.sql` updates a student record, deletes another, and queries `audit_log`.
- `audit/audit_results.md` documents the audit trail output.

## Security Implementation Summary

- `security/roles_and_permissions.sql` defines `app_read` and `app_write` roles
- `security/user_creation.sql` creates the `api` user assigned to `app_write`
- `security/security_notes.md` explains least-privilege access, role separation, and why application users should avoid superuser privileges
