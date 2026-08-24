#!/usr/bin/env bash
set -euo pipefail

createdb campuslearn_restore
pg_restore -d campuslearn_restore --clean --if-exists backups/capstone_$(date +%F).dump
