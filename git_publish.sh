#!/bin/bash
# 1. このスクリプトがある場所（workspace）へ移動
cd "$(dirname "$0")"

CONTENT=$1
DATE=$(date +'%Y-%m-%d')
FILENAME="posts/${DATE}.md"

# 2. 記事を保存
mkdir -p posts
echo "$CONTENT" > "$FILENAME"

# 3. Gitで送信
git add .
git commit -m "Blog auto-post: $FILENAME"
git push origin master
