CREATE TABLE IF NOT EXISTS audit_events (
    audit_id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(100) NOT NULL,
    action VARCHAR(20) NOT NULL,
    record_id UUID,
    actor_id UUID,
    payload JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION log_audit_event()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_events (table_name, action, record_id, actor_id, payload)
    VALUES (
        TG_TABLE_NAME,
        TG_OP,
        COALESCE(NEW.user_id, NEW.course_id, NEW.enrollment_id, NEW.submission_id, OLD.user_id, OLD.course_id, OLD.enrollment_id, OLD.submission_id),
        current_setting('app.current_user_id', true)::UUID,
        to_jsonb(COALESCE(NEW, OLD))
    );
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_audit
AFTER INSERT OR UPDATE OF email, role, is_active OR DELETE ON users
FOR EACH ROW EXECUTE FUNCTION log_audit_event();

CREATE TRIGGER courses_audit
AFTER INSERT OR UPDATE OF title, status OR DELETE ON courses
FOR EACH ROW EXECUTE FUNCTION log_audit_event();

CREATE TRIGGER enrollments_audit
AFTER INSERT OR UPDATE OF enrollment_status, progress_pct OR DELETE ON enrollments
FOR EACH ROW EXECUTE FUNCTION log_audit_event();
