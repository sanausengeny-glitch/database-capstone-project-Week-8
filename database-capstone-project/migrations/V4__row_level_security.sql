ALTER TABLE organizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION app.current_organization_id()
RETURNS UUID AS $$
BEGIN
    RETURN current_setting('app.current_organization_id', true)::UUID;
EXCEPTION WHEN others THEN
    RETURN NULL;
END;
$$ LANGUAGE plpgsql STABLE;

CREATE POLICY org_isolation_users
ON users
FOR ALL
USING (organization_id = app.current_organization_id() OR current_user = 'postgres');

CREATE POLICY org_isolation_courses
ON courses
FOR ALL
USING (organization_id = app.current_organization_id() OR current_user = 'postgres');

CREATE POLICY org_isolation_enrollments
ON enrollments
FOR ALL
USING (organization_id = app.current_organization_id() OR current_user = 'postgres');

CREATE POLICY org_isolation_submissions
ON submissions
FOR ALL
USING (organization_id = app.current_organization_id() OR current_user = 'postgres');

ALTER TABLE organizations FORCE ROW LEVEL SECURITY;
ALTER TABLE users FORCE ROW LEVEL SECURITY;
ALTER TABLE courses FORCE ROW LEVEL SECURITY;
ALTER TABLE enrollments FORCE ROW LEVEL SECURITY;
ALTER TABLE submissions FORCE ROW LEVEL SECURITY;
