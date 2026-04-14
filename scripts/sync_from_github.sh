#!/bin/bash
# Sync everything from Dissertation GitHub repo into Slides/dissertation/.
# Usage: ./scripts/sync_from_github.sh

set -euo pipefail

GITHUB_URL="https://github.com/zrchen-econ/Dissertation.git"
TMP_DIR="/tmp/dissertation-slides-sync"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$PROJECT_ROOT/Slides/dissertation"

echo "Cloning from $GITHUB_URL ..."
rm -rf "$TMP_DIR"
git clone --depth=1 "$GITHUB_URL" "$TMP_DIR"

echo "Syncing all files → Slides/dissertation/"
mkdir -p "$DEST"
rsync -av --exclude='.git' "$TMP_DIR/" "$DEST/"

rm -rf "$TMP_DIR"
echo "Sync complete."
