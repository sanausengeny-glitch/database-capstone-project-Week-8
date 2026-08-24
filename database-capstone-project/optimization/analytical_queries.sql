-- 1. Monthly enrollment trend
SELECT
    DATE_TRUNC('month', enrolled_at) AS month,
    COUNT(*) AS enrollments
FROM enrollments
GROUP BY DATE_TRUNC('month', enrolled_at)
ORDER BY month;

-- 2. Course completion rate by course
SELECT
    c.course_id,
    c.title,
    COUNT(e.student_id) AS enrolled_students,
    ROUND(100.0 * SUM(CASE WHEN e.enrollment_status = 'completed' THEN 1 ELSE 0 END) / NULLIF(COUNT(e.student_id), 0), 2) AS completion_pct
FROM courses c
LEFT JOIN enrollments e ON e.course_id = c.course_id
GROUP BY c.course_id, c.title
ORDER BY completion_pct DESC;

-- 3. Top-performing students by average score
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    ROUND(AVG(s.score), 2) AS avg_score
FROM submissions s
JOIN users u ON u.user_id = s.student_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY avg_score DESC;

-- 4. Total revenue by payment status
SELECT
    payment_status,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status
ORDER BY total_amount DESC;

-- 5. Assessment totals by course
SELECT
    course_id,
    COUNT(*) AS total_assessments,
    SUM(weight_pct) AS cumulative_weight
FROM assessments
GROUP BY course_id
ORDER BY cumulative_weight DESC;

-- 6. Window function rank by student average score
WITH student_scores AS (
    SELECT
        s.student_id,
        ROUND(AVG(s.score), 2) AS avg_score
    FROM submissions s
    GROUP BY s.student_id
)
SELECT
    u.first_name,
    u.last_name,
    ss.avg_score,
    RANK() OVER (ORDER BY ss.avg_score DESC) AS performance_rank
FROM student_scores ss
JOIN users u ON u.user_id = ss.student_id
ORDER BY performance_rank;
