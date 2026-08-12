-- audit/audit_trigger.sql
-- Create the reusable audit logging infrastructure.

CREATE TABLE IF NOT EXISTS audit_log (
    id SERIAL PRIMARY KEY,
    tbl TEXT NOT NULL,
    op TEXT NOT NULL,
    old_row JSONB,
    new_row JSONB,
    changed_by TEXT NOT NULL DEFAULT CURRENT_USER,
    at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION audit() RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO audit_log(tbl, op, old_row, new_row, changed_by, at)
        VALUES (TG_TABLE_NAME, TG_OP, NULL, to_jsonb(NEW), CURRENT_USER, NOW());
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit_log(tbl, op, old_row, new_row, changed_by, at)
        VALUES (TG_TABLE_NAME, TG_OP, to_jsonb(OLD), to_jsonb(NEW), CURRENT_USER, NOW());
        RETURN NEW;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO audit_log(tbl, op, old_row, new_row, changed_by, at)
        VALUES (TG_TABLE_NAME, TG_OP, to_jsonb(OLD), NULL, CURRENT_USER, NOW());
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_audit ON students;
CREATE TRIGGER trg_audit
AFTER INSERT OR UPDATE OR DELETE ON students
FOR EACH ROW EXECUTE FUNCTION audit();
