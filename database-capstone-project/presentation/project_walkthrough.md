# Project Walkthrough

## Problem solved
The project solves the need for an academic platform that centralizes course, enrollment, payments, and reporting data while preserving security and a clear audit trail.

## Design choices
PostgreSQL was selected for the transactional core because of its strong relational model and governance features. Redis and MongoDB add complementary capabilities for speed and flexible event storage.

## Schema structure
The main schema supports organizations, users, courses, modules, assessments, enrollments, submissions, payments, and audit history.

## Optimization results
The optimization work focuses on reducing full-table scans and improving reporting speed through targeted indexes and partial filters.

## Security implementation
The database uses least-privilege roles, row-level security, and auditing to protect sensitive academic records.
