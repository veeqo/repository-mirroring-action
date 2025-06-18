#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add codecommit "$INPUT_TARGET_REPO_URL"

# Push only master branch
git push codecommit master

# Run cleanup script
/cleanup.sh codecommit

# List remotes
git ls-remote codecommit