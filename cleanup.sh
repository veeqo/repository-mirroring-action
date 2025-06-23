#!/usr/bin/env sh
set -eu

# Remove HEAD reference if it exists, but handle errors gracefully
git push "$1" :refs/heads/HEAD 2>/dev/null || true

# Ensure we exit with success regardless of HEAD reference removal
exit 0