#!/bin/bash
set -e

PROJECT_DIR="/c/Users/HP/Pictures/react/12-adv-starting-project"
REPO_URL="https://github.com/Messi111095/12-adv-starting-project.git"
BRANCH_NAME="main"
COMMIT_MESSAGE="Upload project"

cd "$PROJECT_DIR"

if [ ! -d ".git" ]; then
  git init
fi

git branch -M "$BRANCH_NAME"

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi

git add .

if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "$COMMIT_MESSAGE"
fi

git push -u origin "$BRANCH_NAME"

echo "Project uploaded successfully."