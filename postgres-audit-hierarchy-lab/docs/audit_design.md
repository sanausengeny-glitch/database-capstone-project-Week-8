# Audit Design

## How the Audit Log Works

The audit log is implemented with a PostgreSQL trigger function named `audit()`. When a row is inserted, updated, or deleted on the audited table, the trigger fires and writes a record to the `audit_log` table.

Each audit record includes:
- `tbl`: the source table name
- `op`: the operation type (`INSERT`, `UPDATE`, or `DELETE`)
- `old_row`: the row state before the change
- `new_row`: the row state after the change
- `changed_by`: the database user who made the change
- `at`: the timestamp of the change

## Why Triggers Are Useful

Triggers are useful because they execute automatically inside the database whenever data changes. This ensures the audit log is populated reliably and consistently, without requiring application-level code changes.

Triggers also centralize auditing logic, so multiple applications or users modifying the same table still generate the same audit records.

## Advantages of Storing Changes as JSONB

Storing `old_row` and `new_row` as `JSONB` provides flexibility and easy comparison. JSONB preserves the complete row structure, supports fast indexing, and allows querying changed fields using JSON operators.

Using JSONB also means the audit schema does not need to change when the audited table schema changes, which makes the audit system more reusable across tables.