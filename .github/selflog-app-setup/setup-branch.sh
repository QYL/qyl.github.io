#!/bin/bash

# Script to create the selflog-app branch for GitHub Pages
# This script must be run from the repository root

set -e

echo "Creating selflog-app branch..."

# Store current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Create orphan branch (no history)
git checkout --orphan selflog-app

# Remove all files from staging
git rm -rf --cached .

# Clean the working directory (except .git)
find . -maxdepth 1 ! -name '.git' ! -name '.' ! -name '..' -exec rm -rf {} +

# Copy the setup files to root
cp .github/selflog-app-setup/index.html ./index.html
cp .github/selflog-app-setup/CNAME ./CNAME

# Stage the files
git add index.html CNAME

# Commit
git commit -m "Initialize selflog-app branch with landing page and CNAME"

# Push to origin
git push -u origin selflog-app

echo "✓ selflog-app branch created successfully!"
echo ""
echo "Next steps:"
echo "1. Go to repository Settings → Pages"
echo "2. Configure the source to deploy from the 'selflog-app' branch"
echo "3. The custom domain 'selflog.app' should be automatically detected from the CNAME file"
echo ""
echo "Switching back to $CURRENT_BRANCH..."
git checkout "$CURRENT_BRANCH"
