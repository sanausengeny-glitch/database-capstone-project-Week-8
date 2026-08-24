#!/usr/bin/env bash
set -euo pipefail

pg_dump -Fc -f "backups/capstone_$(date +%F).dump" campuslearn
