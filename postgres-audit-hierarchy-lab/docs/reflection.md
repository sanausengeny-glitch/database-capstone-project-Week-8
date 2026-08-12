# Reflection

During this lab, I learned how audit logging can provide a durable, automatic record of database changes. The trigger-based audit function is a powerful mechanism because it captures inserts, updates, and deletes at the database layer, independent of application code.

Recursive queries are a practical way to traverse hierarchical data in PostgreSQL. The `WITH RECURSIVE` CTE allows the database to walk parent-child relationships and produce a full tree without multiple round-trips or application-side recursion.

Versioned database migrations bring order and reliability to schema changes. Using migration files ensures that schema updates are executed in a consistent sequence, makes rollbacks and audits simpler, and reduces the risk of manual drift between environments.

Least-privilege security is important because it limits what each application or user account can do. By creating separate `app_read` and `app_write` roles, read-only access can be enforced separately from write permissions, and the application user does not require superuser privileges.

The most useful topic for me was least-privilege security. It is the most important for production systems because it directly reduces the risk of data loss or unauthorized changes if credentials are compromised.

Overall, this lab showed how auditing, hierarchical modeling, migrations, and role-based access control work together to make a database system more secure, maintainable, and auditable.