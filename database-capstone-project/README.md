# CampusLearn Database Capstone Project

## Project Overview
CampusLearn is a portfolio-ready Learning Management System designed to demonstrate relational database design, schema migration, optimization, security, backup planning, and NoSQL integration.

## Objectives
- Model a realistic academic platform.
- Implement PostgreSQL schema and Flyway-style migration files.
- Add indexing and query optimization evidence.
- Apply security controls with roles and RLS.
- Document Redis and MongoDB use cases.
- Prepare backup and presentation materials.

## Repository Structure
- requirements/ - business requirements and ER diagram
- migrations/ - core schema, indexes, audit logic, RLS, and seed data
- nosql/ - Redis and MongoDB design and setup notes
- optimization/ - SQL analysis and EXPLAIN evidence
- security/ - roles, policies, and audit solution
- backups/ - backup and restore scripts
- presentation/ - architecture and demo materials
- docs/ - data dictionary, reports, and architecture diagram

## Technologies Used
- PostgreSQL
- Flyway-style migrations
- Redis
- MongoDB
- SQL, Bash, Markdown

## Setup Instructions
1. Create a PostgreSQL database named `campuslearn`.
2. Run the SQL migration files in `migrations/` in order.
3. Apply the security scripts in `security/`.
4. Review the NoSQL design under `nosql/`.
5. Use the backup script in `backups/` for restore testing.

## Running Migrations
```bash
createdb campuslearn
flyway clean migrate
```

## Restore Backups
```bash
bash backups/restore_commands.sh
```

## Database Use Case
The platform manages universities or learning organizations with students, instructors, courses, assessments, fees, and reporting needs. It is designed to be realistic enough for interviews and technical documentation.
