# Security Notes

## Least Privilege

Least privilege means granting users and applications only the permissions they need to do their work, and no more. This reduces the risk of accidental or malicious changes and limits the blast radius of compromised credentials.

## Why Applications Should Not Use Superuser Accounts

Applications should avoid superuser accounts because superusers can bypass security controls, modify any schema, and access all data. If an application account is compromised, a superuser credential would allow attackers to make destructive changes and access sensitive information.

## Differences Between `app_read` and `app_write`

- `app_read`: can connect to the database, use the public schema, and perform only `SELECT` queries on tables.
- `app_write`: can connect to the database, use the public schema, and perform `SELECT`, `INSERT`, `UPDATE`, and `DELETE` on tables.

By separating these roles, read-only workloads can be restricted from making changes, while write-capable application users receive a controlled set of permissions.