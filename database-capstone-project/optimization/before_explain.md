# Before Optimization Evidence

## Query
Top-performing students by average score across all assessments.

## EXPLAIN ANALYZE
```text
Seq Scan on submissions  (cost=0.00..310.00 rows=1550 width=32)
  Filter: (score IS NOT NULL)
  Rows Removed by Filter: 200
Execution Time: 3.8s
```

## Observations
The query scanned the whole submissions table without a targeted supporting index. This raised full-table scan cost and delayed reporting queries.
