#!/bin/sh
# 바탕화면의 Miracle1_dashboard.html을 GitHub Pages로 게시
# 사용: sh publish.sh "변경 내용"
set -e
cd "$(dirname "$0")"
cp "/c/Users/LJ/OneDrive/Desktop/Miracle1_dashboard.html" Miracle1_dashboard.html
B=$(date +%Y%m%d%H%M%S)
sed -i "s/const BUILD = '[^']*'/const BUILD = '$B'/" Miracle1_dashboard.html
git add -A
git commit -q -m "${1:-Update dashboard}" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" || { echo "변경 없음"; exit 0; }
git push -q origin main
echo "게시 완료: build $B"
