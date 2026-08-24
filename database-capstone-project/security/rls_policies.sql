ALTER TABLE organizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;

CREATE POLICY org_user_policy
ON users
FOR ALL
USING (organization_id = current_setting('app.current_organization_id', true)::UUID);

CREATE POLICY org_course_policy
ON courses
FOR ALL
USING (organization_id = current_setting('app.current_organization_id', true)::UUID);

CREATE POLICY org_enrollment_policy
ON enrollments
FOR ALL
USING (organization_id = current_setting('app.current_organization_id', true)::UUID);

CREATE POLICY org_submission_policy
ON submissions
FOR ALL
USING (organization_id = current_setting('app.current_organization_id', true)::UUID);
