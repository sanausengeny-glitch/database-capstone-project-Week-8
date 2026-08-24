INSERT INTO organizations (organization_id, name, status)
VALUES
    ('11111111-1111-1111-1111-111111111111', 'North Lake University', 'active'),
    ('22222222-2222-2222-2222-222222222222', 'Summit Academy', 'active');

INSERT INTO users (user_id, organization_id, first_name, last_name, email, password_hash, role, is_active)
VALUES
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Alicia', 'Stone', 'alicia.stone@nlu.edu', 'hash_admin_1', 'admin', TRUE),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'Marcus', 'Lane', 'marcus.lane@nlu.edu', 'hash_instructor_1', 'instructor', TRUE),
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111', 'Priya', 'Nair', 'priya.nair@nlu.edu', 'hash_student_1', 'student', TRUE),
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '11111111-1111-1111-1111-111111111111', 'Omar', 'Fields', 'omar.fields@nlu.edu', 'hash_student_2', 'student', TRUE),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', 'Hannah', 'Cruz', 'hannah.cruz@sa.edu', 'hash_admin_2', 'admin', TRUE),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', '22222222-2222-2222-2222-222222222222', 'Darius', 'Hall', 'darius.hall@sa.edu', 'hash_instructor_2', 'instructor', TRUE);

INSERT INTO courses (course_id, organization_id, instructor_id, title, description, credits, status)
VALUES
    ('33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Database Design Fundamentals', 'Core database modeling, normalization, and SQL design.', 3, 'active'),
    ('44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Data Analysis Workshop', 'Hands-on analytics and SQL querying.', 3, 'active'),
    ('55555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', 'ffffffff-ffff-ffff-ffff-ffffffffffff', 'Systems Security Essentials', 'Security fundamentals and defensive design.', 2, 'active');

INSERT INTO course_modules (module_id, course_id, title, content_url, sort_order)
VALUES
    ('66666666-6666-6666-6666-666666666666', '33333333-3333-3333-3333-333333333333', 'Relational Modeling', 'https://campuslearn.example/modules/relational-modeling', 1),
    ('77777777-7777-7777-7777-777777777777', '33333333-3333-3333-3333-333333333333', 'SQL Optimization', 'https://campuslearn.example/modules/sql-optimization', 2),
    ('88888888-8888-8888-8888-888888888888', '44444444-4444-4444-4444-444444444444', 'Query Patterns', 'https://campuslearn.example/modules/query-patterns', 1),
    ('99999999-9999-9999-9999-999999999999', '55555555-5555-5555-5555-555555555555', 'Authentication and Access Control', 'https://campuslearn.example/modules/auth-security', 1);

INSERT INTO enrollments (enrollment_id, organization_id, student_id, course_id, enrollment_status, progress_pct)
VALUES
    ('aaaaaaaa-0000-0000-0000-000000000001', '11111111-1111-1111-1111-111111111111', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '33333333-3333-3333-3333-333333333333', 'active', 72),
    ('aaaaaaaa-0000-0000-0000-000000000002', '11111111-1111-1111-1111-111111111111', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '33333333-3333-3333-3333-333333333333', 'completed', 100),
    ('aaaaaaaa-0000-0000-0000-000000000003', '11111111-1111-1111-1111-111111111111', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '44444444-4444-4444-4444-444444444444', 'active', 45),
    ('aaaaaaaa-0000-0000-0000-000000000004', '22222222-2222-2222-2222-222222222222', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '55555555-5555-5555-5555-555555555555', 'active', 81);

INSERT INTO assessments (assessment_id, organization_id, course_id, title, weight_pct, due_at)
VALUES
    ('bbbbbbbb-0000-0000-0000-000000000001', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'ER Diagram Quiz', 20, NOW() + INTERVAL '7 days'),
    ('bbbbbbbb-0000-0000-0000-000000000002', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', 'SQL Performance Lab', 30, NOW() + INTERVAL '10 days');

INSERT INTO submissions (submission_id, organization_id, assessment_id, student_id, score, status)
VALUES
    ('cccccccc-0000-0000-0000-000000000001', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-0000-0000-0000-000000000001', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 94.00, 'graded'),
    ('cccccccc-0000-0000-0000-000000000002', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-0000-0000-0000-000000000001', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 88.00, 'graded'),
    ('cccccccc-0000-0000-0000-000000000003', '11111111-1111-1111-1111-111111111111', 'bbbbbbbb-0000-0000-0000-000000000002', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 91.50, 'graded');

INSERT INTO payments (payment_id, organization_id, student_id, amount, payment_status, payment_method, paid_at)
VALUES
    ('dddddddd-0000-0000-0000-000000000001', '11111111-1111-1111-1111-111111111111', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 299.99, 'paid', 'credit_card', NOW() - INTERVAL '10 days'),
    ('dddddddd-0000-0000-0000-000000000002', '11111111-1111-1111-1111-111111111111', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 299.99, 'paid', 'bank_transfer', NOW() - INTERVAL '5 days');
