#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add codecommit "$INPUT_TARGET_REPO_URL"

# Debug info
if [ "${INPUT_DEBUG:-true}" = "true" ]; then
  echo "DEBUG: Pushing master branch to $INPUT_TARGET_REPO_URL"
fi

# Push only master branch
git push codecommit master

# Debug info
if [ "${INPUT_DEBUG:-true}" = "true" ]; then
  echo "DEBUG: Push completed, running cleanup script"
fi

# Run cleanup script
/cleanup.sh codecommit

# Debug info
if [ "${INPUT_DEBUG:-true}" = "true" ]; then
  echo "DEBUG: Mirroring process completed"
  echo "DEBUG: Checking final remote refs:"
  git ls-remote codecommit
fi