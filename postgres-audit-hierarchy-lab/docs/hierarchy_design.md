# Hierarchy Design

## Adjacency-List Hierarchy Design

The categories table uses an adjacency-list design, where each row stores a reference to its parent row. The `parent_id` column points to the `id` of another category in the same table.

This design is simple to implement and works well for hierarchies that change at moderate rates.

## Self-Referencing Foreign Keys

The `parent_id` column is defined as a foreign key referencing `categories(id)`. This enforces referential integrity and prevents invalid parent pointers.

```sql
parent_id INTEGER REFERENCES categories(id) ON DELETE SET NULL
```

Using a self-referencing foreign key allows categories to form a tree structure within a single table.

## Recursive CTE Traversal

A recursive CTE starts with the root nodes (where `parent_id IS NULL`) and repeatedly joins children back to the recursive result set.

The recursive query builds a path and a level for each node, allowing the full hierarchy to be displayed in a single query.

Recursive CTEs are ideal for adjacency-list hierarchies because they can traverse arbitrary depth without requiring application-side recursion.