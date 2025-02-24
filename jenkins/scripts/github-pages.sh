#!/usr/bin/env sh
set -x

# Debugging: Cek apakah variabel tersedia
echo "GITHUB_TOKEN: ${GITHUB_TOKEN}"
echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"

if [ -z "$GITHUB_TOKEN" ] || [ -z "$GITHUB_REPOSITORY" ]; then
  echo "Error: GITHUB_TOKEN or GITHUB_REPOSITORY is not set."
  exit 1
fi

# Set user config
git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"

# Set the correct GitHub URL
git remote set-url origin https://git:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git

# Run gh-pages
npx gh-pages --message '[skip ci] Updates' --dist build