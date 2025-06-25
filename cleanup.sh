#!/usr/bin/env sh
set -eu

echo "Removing HEAD reference from mirror repository"

# Remove refs/heads/HEAD reference from CodeCommit to prevent PicaPica Sync failures
# Use timeout to prevent hanging and suppress all output
timeout 60 git push "$1" :refs/heads/HEAD >/dev/null 2>&1 || true

echo "Cleanup completed successfully"