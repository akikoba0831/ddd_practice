#!/bin/sh
set -eu

npm ci --no-fund --no-audit

exec "$@"
