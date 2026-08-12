-- hierarchy/category_tree_query.sql
-- Recursive CTE to display the full categories hierarchy.

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
