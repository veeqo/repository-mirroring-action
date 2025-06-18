#!/usr/bin/env sh
set -eu

# Check and remove refs/heads/HEAD if it exists
if git ls-remote "$1" refs/heads/HEAD >/dev/null 2>&1; then
  echo "Removing refs/heads/HEAD reference from mirror repository"
  git push "$1" :refs/heads/HEAD
else
  echo "No HEAD reference found in mirror repository"
fi