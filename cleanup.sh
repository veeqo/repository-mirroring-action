#!/usr/bin/env sh
set -eu

# Debug information
if [ "${INPUT_DEBUG:-true}" = "true" ]; then
  echo "DEBUG: Attempting to remove HEAD reference from $1"
  git ls-remote "$1" HEAD || echo "DEBUG: No HEAD reference found before removal"
fi

# Sleep briefly to ensure the previous push operation is complete
sleep 5

# Remove HEAD reference if it exists - try both formats
echo "Removing HEAD reference from mirror repository"
git push "$1" :refs/heads/HEAD || echo "DEBUG: Failed to remove :refs/heads/HEAD"
git push "$1" :HEAD || echo "DEBUG: Failed to remove :HEAD"

# Verify removal
if [ "${INPUT_DEBUG:-true}" = "true" ]; then
  echo "DEBUG: Verifying HEAD reference removal"
  git ls-remote "$1" HEAD || echo "DEBUG: HEAD reference not found after removal (expected)"
fi