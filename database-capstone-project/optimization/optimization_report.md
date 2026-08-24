# Optimization Report

QUERY:
Top-performing students by average score

BEFORE PLAN:
Seq Scan on submissions with a filter on score

CHANGE:
Added a partial index on submissions(student_id, score) where score is not null

AFTER PLAN:
Index Scan using idx_submissions_student_score

RESULT:
3.8s -> 65ms

QUERY:
Monthly enrollment trend

BEFORE PLAN:
Seq Scan on enrollments with date truncation over the full table

CHANGE:
Added an index on enrollments(course_id, enrollment_status, enrolled_at)

AFTER PLAN:
Bitmap Index Scan followed by a heap fetch

RESULT:
2.1s -> 220ms

QUERY:
Course completion rate by course

BEFORE PLAN:
HashAggregate over a large join between courses and enrollments

CHANGE:
Added an index on enrollments(course_id, enrollment_status)

AFTER PLAN:
GroupAggregate with indexed join path

RESULT:
1.7s -> 180ms
