CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS organizations (
    organization_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(150) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID NOT NULL REFERENCES organizations(organization_id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash TEXT NOT NULL,
    role VARCHAR(30) NOT NULL CHECK (role IN ('student','instructor','admin','finance','support')),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (organization_id, email)
);

CREATE TABLE IF NOT EXISTS courses (
    course_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID NOT NULL REFERENCES organizations(organization_id) ON DELETE CASCADE,
    instructor_id UUID NOT NULL REFERENCES users(user_id),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    credits INTEGER NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL DEFAULT 'draft',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS course_modules (
    module_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    course_id UUID NOT NULL REFERENCES courses(course_id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    content_url TEXT,
    sort_order INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID NOT NULL REFERENCES organizations(organization_id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES users(user_id),
    course_id UUID NOT NULL REFERENCES courses(course_id),
    enrollment_status VARCHAR(20) NOT NULL DEFAULT 'active' CHECK (enrollment_status IN ('active','completed','dropped','waitlisted')),
    enrolled_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    completed_at TIMESTAMPTZ,
    progress_pct INTEGER NOT NULL DEFAULT 0 CHECK (progress_pct BETWEEN 0 AND 100),
    UNIQUE (student_id, course_id)
);

CREATE TABLE IF NOT EXISTS assessments (
    assessment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID NOT NULL REFERENCES organizations(organization_id) ON DELETE CASCADE,
    course_id UUID NOT NULL REFERENCES courses(course_id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    weight_pct NUMERIC(5,2) NOT NULL DEFAULT 0,
    due_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS submissions (
    submission_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID NOT NULL REFERENCES organizations(organization_id) ON DELETE CASCADE,
    assessment_id UUID NOT NULL REFERENCES assessments(assessment_id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES users(user_id),
    score NUMERIC(5,2),
    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    status VARCHAR(20) NOT NULL DEFAULT 'submitted' CHECK (status IN ('draft','submitted','late','graded'))
);

CREATE TABLE IF NOT EXISTS payments (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID NOT NULL REFERENCES organizations(organization_id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES users(user_id),
    amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),
    payment_status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK (payment_status IN ('pending','paid','failed','refunded')),
    payment_method VARCHAR(30),
    paid_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS audit_log (
    audit_id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(100) NOT NULL,
    record_id UUID NOT NULL,
    action VARCHAR(20) NOT NULL CHECK (action IN ('INSERT','UPDATE','DELETE')),
    changed_by UUID,
    changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    old_values JSONB,
    new_values JSONB
);

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_users_updated_at
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_courses_updated_at
BEFORE UPDATE ON courses
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();
