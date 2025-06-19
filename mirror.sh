#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add codecommit "$INPUT_TARGET_REPO_URL"

# Determine default branch
DEFAULT_BRANCH=$(git symbolic-ref --short HEAD || echo "master")
echo "Using default branch: $DEFAULT_BRANCH"

# Push the default branch
git push codecommit "$DEFAULT_BRANCH"

# Run cleanup script
/cleanup.sh codecommit