#!/bin/bash

REPO_URL="git@github.com:ltpp-universe/vue-wasm.git"
BRANCH_NAME="feature-auto-pr"
BASE_BRANCH="master"
COMMIT_MESSAGE="Auto-generated commit for PR"
PR_TITLE="Auto-generated PR"
PR_BODY="This is an auto-generated pull request."
GH_MERGE_METHOD="merge"

echo "Fetching latest changes..."
git checkout "$BASE_BRANCH"
git pull origin "$BASE_BRANCH"

TIMESTAMP=$(date +%s)
NEW_BRANCH_NAME="${BRANCH_NAME}-${TIMESTAMP}"
echo "Creating new branch: $NEW_BRANCH_NAME"
git checkout -b "$NEW_BRANCH_NAME"

TIME_FILE="time"
echo "Creating 'time' file with timestamp..."
date +%s > "$TIME_FILE"
git add "$TIME_FILE"

echo "Committing changes..."
git commit -m "$COMMIT_MESSAGE"

echo "Pushing changes to remote..."
git push origin "$NEW_BRANCH_NAME"

echo "Creating pull request..."
gh pr create --base "$BASE_BRANCH" --head "$NEW_BRANCH_NAME" --title "$PR_TITLE" --body "$PR_BODY"

echo "Merging pull request..."
gh pr merge "$NEW_BRANCH_NAME" --"$GH_MERGE_METHOD" --delete-branch --auto

echo "Pull request created and merged successfully!"
