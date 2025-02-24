#!/usr/bin/env sh
set -x

if [ -z "$GITHUB_TOKEN" ] || [ -z "$GITHUB_REPOSITORY" ]; then
  echo "Error: GITHUB_TOKEN or GITHUB_REPOSITORY is not set."
  exit 1
fi

# Set user config
git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"

# Pastikan berada di branch react-app sebelum menjalankan gh-pages
git checkout react-app || { echo "Branch react-app not found"; exit 1; }

# Set the correct GitHub URL
git remote set-url origin https://git:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git

# Push ke GitHub Pages dari react-app
npx gh-pages --message '[skip ci] Updates' --dist build --branch gh-pages