#!/bin/bash
# Sync slides and figures from GitHub repo into this project.
# Usage: ./scripts/sync_from_github.sh

set -euo pipefail

GITHUB_URL="https://github.com/zrchen-econ/Dissertation.git"
TMP_DIR="/tmp/dissertation-slides-sync"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Cloning from $GITHUB_URL ..."
rm -rf "$TMP_DIR"
git clone "$GITHUB_URL" "$TMP_DIR"

echo "Copying .tex files → Slides/"
cp "$TMP_DIR"/*.tex "$PROJECT_ROOT/Slides/" 2>/dev/null || true

echo "Copying figures → Figures/"
cp "$TMP_DIR"/Graph/*.png "$PROJECT_ROOT/Figures/" 2>/dev/null || true

rm -rf "$TMP_DIR"
echo "Sync complete."
