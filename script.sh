#!/usr/bin/env bash
set -euo pipefail
echo "Hello from Jenkins at $(date)"
uname -a
df -h | head -n 5
