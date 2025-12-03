# Selflog-App Branch Setup

This directory contains the files and script needed to create the `selflog-app` branch for serving the selflog.app landing page via GitHub Pages.

## Contents

- `index.html` - The landing page for selflog.app (copied from `selflogapp/index.html`)
- `CNAME` - Contains the custom domain `selflog.app`
- `setup-branch.sh` - Automated setup script

## Quick Setup (Recommended)

Run the automated setup script from the repository root:

```bash
bash .github/selflog-app-setup/setup-branch.sh
```

This script will:
1. Create a new orphan branch called `selflog-app`
2. Copy the necessary files to the branch root
3. Commit and push the branch to origin
4. Return you to your previous branch

## Manual Setup

If you prefer to set up the branch manually:

### 1. Create the orphan branch

```bash
git checkout --orphan selflog-app
```

### 2. Clear the staging area

```bash
git rm -rf --cached .
```

### 3. Remove all files from working directory

```bash
rm -rf 2017 404.html about app archives categories creation css dialogueapp images js lib selflogapp tags index.html
```

### 4. Copy the required files

```bash
cp .github/selflog-app-setup/index.html ./index.html
cp .github/selflog-app-setup/CNAME ./CNAME
```

### 5. Stage and commit

```bash
git add index.html CNAME
git commit -m "Initialize selflog-app branch with landing page and CNAME"
```

### 6. Push to origin

```bash
git push -u origin selflog-app
```

### 7. Switch back to your previous branch

```bash
git checkout master  # or your preferred branch
```

## GitHub Pages Configuration

After the `selflog-app` branch is created and pushed:

1. Go to repository **Settings → Pages**
2. Under "Source", select:
   - Branch: `selflog-app`
   - Folder: `/ (root)`
3. Click **Save**
4. The custom domain `selflog.app` should be automatically detected from the CNAME file
5. GitHub Pages will deploy the site at `https://selflog.app`

## Branch Structure

The `selflog-app` branch contains only:
- `index.html` - The self-contained landing page with inline CSS
- `CNAME` - The custom domain configuration

This minimal structure keeps the branch clean and focused on serving the selflog.app landing page.
