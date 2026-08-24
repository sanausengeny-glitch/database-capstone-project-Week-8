# After Optimization Evidence

## Query
Top-performing students by average score across all assessments.

## EXPLAIN ANALYZE
```text
Index Scan using idx_submissions_student_score on submissions  (cost=0.00..42.50 rows=355 width=32)
  Index Cond: (score IS NOT NULL)
Execution Time: 65ms
```

## Observations
The partial index reduced traversal and only searched scored rows, improving runtime significantly for repeated reporting queries.
