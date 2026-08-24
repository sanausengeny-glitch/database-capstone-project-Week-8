# CampusLearn Data Dictionary

## Table: organizations
- organization_id: UUID, primary key
- name: VARCHAR(150), not null
- status: VARCHAR(20), default active
- created_at: TIMESTAMPTZ, not null

## Table: users
- user_id: UUID, primary key
- organization_id: UUID, foreign key to organizations
- first_name: VARCHAR(100), not null
- last_name: VARCHAR(100), not null
- email: VARCHAR(255), not null
- password_hash: TEXT, not null
- role: VARCHAR(30), not null
- is_active: BOOLEAN, default true
- created_at: TIMESTAMPTZ, not null
- updated_at: TIMESTAMPTZ, not null

## Table: courses
- course_id: UUID, primary key
- organization_id: UUID, foreign key to organizations
- instructor_id: UUID, foreign key to users
- title: VARCHAR(200), not null
- description: TEXT
- credits: INTEGER, default 0
- status: VARCHAR(20), default draft
- created_at: TIMESTAMPTZ, not null
- updated_at: TIMESTAMPTZ, not null

## Table: course_modules
- module_id: UUID, primary key
- course_id: UUID, foreign key to courses
- title: VARCHAR(150), not null
- content_url: TEXT
- sort_order: INTEGER, not null
- created_at: TIMESTAMPTZ, not null

## Table: enrollments
- enrollment_id: UUID, primary key
- organization_id: UUID, foreign key to organizations
- student_id: UUID, foreign key to users
- course_id: UUID, foreign key to courses
- enrollment_status: VARCHAR(20), default active
- enrolled_at: TIMESTAMPTZ, not null
- completed_at: TIMESTAMPTZ
- progress_pct: INTEGER, default 0

## Table: assessments
- assessment_id: UUID, primary key
- organization_id: UUID, foreign key to organizations
- course_id: UUID, foreign key to courses
- title: VARCHAR(200), not null
- weight_pct: NUMERIC(5,2), default 0
- due_at: TIMESTAMPTZ
- created_at: TIMESTAMPTZ, not null

## Table: submissions
- submission_id: UUID, primary key
- organization_id: UUID, foreign key to organizations
- assessment_id: UUID, foreign key to assessments
- student_id: UUID, foreign key to users
- score: NUMERIC(5,2)
- submitted_at: TIMESTAMPTZ, not null
- status: VARCHAR(20), default submitted

## Table: payments
- payment_id: UUID, primary key
- organization_id: UUID, foreign key to organizations
- student_id: UUID, foreign key to users
- amount: NUMERIC(10,2), not null
- payment_status: VARCHAR(20), default pending
- payment_method: VARCHAR(30)
- paid_at: TIMESTAMPTZ

## Table: audit_log
- audit_id: BIGSERIAL, primary key
- table_name: VARCHAR(100), not null
- record_id: UUID, not null
- action: VARCHAR(20), not null
- changed_by: UUID
- changed_at: TIMESTAMPTZ, default now()
- old_values: JSONB
- new_values: JSONB
