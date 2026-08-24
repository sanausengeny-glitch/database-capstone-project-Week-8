# Final Report

## Project Summary
CampusLearn is a Learning Management System designed to show a complete database engineering lifecycle. The project centers PostgreSQL as the transactional database and integrates Redis and MongoDB for non-relational needs.

## Design Decisions
The schema was structured around organizations, users, courses, assessments, and payments. This separation helps enforce clear ownership, maintain scaling, and support tenant-aware access patterns.

## Optimization Findings
Indexing and partial index optimization improved query runtime for common reporting patterns. Sequential scans were reduced by adding indexes on frequently filtered and joined columns.

## Security Findings
The design includes least-privilege role definitions, RLS, and audit trails. Passwords should remain hashed in the application layer before insertion into the database.

## Challenges Encountered
The main challenge is balancing correctness with performance and security. Each design decision must support realistic operational workloads while remaining understandable to stakeholders.

## Future Improvements
- materialized reporting views
- stronger migration verification
- external monitoring and dashboarding
- expanded backup automation
