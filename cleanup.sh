#!/usr/bin/env sh
set -eu

# Remove HEAD reference if it exists
git push "$1" :refs/heads/HEAD || true