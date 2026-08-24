CREATE OR REPLACE FUNCTION audit_change()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO audit_log(table_name, record_id, action, changed_by, old_values, new_values)
        VALUES (TG_TABLE_NAME, NEW.id, TG_OP, NULL, NULL, to_jsonb(NEW));
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit_log(table_name, record_id, action, changed_by, old_values, new_values)
        VALUES (TG_TABLE_NAME, NEW.id, TG_OP, NULL, to_jsonb(OLD), to_jsonb(NEW));
        RETURN NEW;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO audit_log(table_name, record_id, action, changed_by, old_values, new_values)
        VALUES (TG_TABLE_NAME, OLD.id, TG_OP, NULL, to_jsonb(OLD), NULL);
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION safe_audit_record()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_TABLE_NAME = 'users' THEN
        INSERT INTO audit_log(table_name, record_id, action, changed_by, old_values, new_values)
        VALUES (TG_TABLE_NAME, COALESCE(NEW.user_id, OLD.user_id), TG_OP, COALESCE(NEW.user_id, OLD.user_id), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_TABLE_NAME = 'courses' THEN
        INSERT INTO audit_log(table_name, record_id, action, changed_by, old_values, new_values)
        VALUES (TG_TABLE_NAME, COALESCE(NEW.course_id, OLD.course_id), TG_OP, COALESCE(NEW.instructor_id, OLD.instructor_id), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_TABLE_NAME = 'enrollments' THEN
        INSERT INTO audit_log(table_name, record_id, action, changed_by, old_values, new_values)
        VALUES (TG_TABLE_NAME, COALESCE(NEW.enrollment_id, OLD.enrollment_id), TG_OP, COALESCE(NEW.student_id, OLD.student_id), to_jsonb(OLD), to_jsonb(NEW));
    ELSIF TG_TABLE_NAME = 'submissions' THEN
        INSERT INTO audit_log(table_name, record_id, action, changed_by, old_values, new_values)
        VALUES (TG_TABLE_NAME, COALESCE(NEW.submission_id, OLD.submission_id), TG_OP, COALESCE(NEW.student_id, OLD.student_id), to_jsonb(OLD), to_jsonb(NEW));
    END IF;
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audit_users
AFTER INSERT OR UPDATE OF first_name, last_name, email, role, is_active OR DELETE ON users
FOR EACH ROW EXECUTE FUNCTION safe_audit_record();

CREATE TRIGGER trg_audit_courses
AFTER INSERT OR UPDATE OF title, description, status OR DELETE ON courses
FOR EACH ROW EXECUTE FUNCTION safe_audit_record();

CREATE TRIGGER trg_audit_enrollments
AFTER INSERT OR UPDATE OF enrollment_status, progress_pct, completed_at OR DELETE ON enrollments
FOR EACH ROW EXECUTE FUNCTION safe_audit_record();

CREATE TRIGGER trg_audit_submissions
AFTER INSERT OR UPDATE OF score, status OR DELETE ON submissions
FOR EACH ROW EXECUTE FUNCTION safe_audit_record();
