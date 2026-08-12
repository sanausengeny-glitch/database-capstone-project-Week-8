# Hierarchy Results

## Query Used

```sql
WITH RECURSIVE category_tree AS (
    SELECT
        id,
        name,
        parent_id,
        name AS path,
        1 AS level
    FROM categories
    WHERE parent_id IS NULL

    UNION ALL

    SELECT
        c.id,
        c.name,
        c.parent_id,
        ct.path || ' > ' || c.name AS path,
        ct.level + 1 AS level
    FROM categories c
    JOIN category_tree ct ON c.parent_id = ct.id
)
SELECT id, name, parent_id, path, level
FROM category_tree
ORDER BY path;
```

## Hierarchy Output

| id | name       | parent_id | path                          | level |
| -- | ---------- | --------- | ----------------------------- | ----- |
| 1  | Electronics| NULL      | Electronics                   | 1     |
| 2  | Computers  | 1         | Electronics > Computers       | 2     |
| 4  | Laptops    | 2         | Electronics > Computers > Laptops | 3 |
| 3  | Phones     | 1         | Electronics > Phones          | 2     |

## How Recursive CTEs Work

- The recursive CTE begins with a base query selecting the root category rows where `parent_id` is `NULL`.
- The `UNION ALL` section then joins the `categories` table back to the CTE on `parent_id = id`.
- Each recursion level extends the path and increments the hierarchy level.
- PostgreSQL repeats the recursive query until no additional child rows are found.

Recursive CTEs are useful for traversing self-referencing hierarchies because they allow the query to walk parent-child relationships in a single statement.