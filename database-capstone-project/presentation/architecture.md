# System Architecture

## Database architecture
The transactional core uses PostgreSQL to store users, courses, enrollments, assessments, submissions, and payment information. It is the source of truth for the application. Indexes and optimized queries reduce the cost of reporting workloads.

## NoSQL integration
- Redis stores session state and fast cache objects.
- MongoDB logs activity events and flexible telemetry records.

## Security design
- role-based access control
- RLS for tenant-specific access
- audit tables for sensitive changes

## Overall architecture
The application layer sits between external users and the storage layer. PostgreSQL guarantees data consistency while Redis and MongoDB support access speed and event processing.
