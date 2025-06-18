#!/usr/bin/env sh
set -eu

# Try direct deletion first with error suppression
git push "$1" :refs/heads/HEAD 2>/dev/null || true

# If direct deletion fails, try using git-push-ref-deletion
echo "Attempting alternative HEAD reference removal method"
git hash-object -t commit --stdin </dev/null | xargs -I {} git push "$1" {}:refs/heads/HEAD --force || true