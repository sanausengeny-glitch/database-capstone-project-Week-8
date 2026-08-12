-- V1__core_tables.sql
-- Core application tables for the audit and hierarchy lab.

CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    enrolled_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO students (name, email)
VALUES
    ('Amina J.', 'amina.j@example.com'),
    ('Kofi M.', 'kofi.m@example.com'),
    ('Nadia S.', 'nadia.s@example.com');
