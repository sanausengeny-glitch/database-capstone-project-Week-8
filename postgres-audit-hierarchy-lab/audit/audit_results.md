# Audit Results

## Audit Log Output

The audit log captures each change to the `students` table.

Example query output:

| tbl      | op     | was       | now      | at                    |
| -------- | ------ | --------- | -------- | --------------------- |
| students | DELETE | Nadia S.  |          | 2026-08-12 12:34:56Z  |
| students | UPDATE | Amina J.  | Kofi M.  | 2026-08-12 12:34:55Z  |

## Changes Captured

- `tbl`: the table that was changed (`students`)
- `op`: the operation type (`INSERT`, `UPDATE`, or `DELETE`)
- `old_row`: JSONB snapshot of the row before the change
- `new_row`: JSONB snapshot of the row after the change
- `changed_by`: the database user who performed the change
- `at`: the timestamp when the audit record was created

## Differences Between Old and New Values

- The `UPDATE` row shows that the `name` value changed from `Amina J.` to `Kofi M.`.
- The `DELETE` row records the deleted student row in `old_row` and leaves `new_row` as `NULL`.

This audit output demonstrates that the trigger-based audit system records both before and after states for updates, and records the deleted row for deletes.