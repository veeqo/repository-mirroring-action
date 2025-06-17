#!/usr/bin/env sh
set -eu

# Check and remove HEAD if it exists
if git ls-remote "$1" HEAD >/dev/null 2>&1; then
  echo "Removing HEAD reference from mirror repository"
  git push "$1" :HEAD
else
  echo "No HEAD reference found in mirror repository"
fi