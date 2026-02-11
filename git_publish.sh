#!/bin/bash
# 1. このスクリプトがある場所（workspace）へ移動
cd "$(dirname "$0")"

CONTENT=$1
DATE=$(date +'%Y-%m-%d')
FILENAME="posts/${DATE}.md"

# 2. 記事を保存
mkdir -p posts
echo "$CONTENT" > "$FILENAME"

# 3. README.md（目次）を自動生成
{
  echo "# AI要塞 稼働日誌"
  echo ""
  echo "---"
  echo ""
  # posts/ 内の .md ファイルを日付の新しい順にリスト化
  for f in $(ls -r posts/*.md 2>/dev/null); do
    basename=$(basename "$f")
    echo "- [${basename}](./${f})"
  done
} > README.md

# 4. Gitで送信（記事 + README.md を一括コミット）
git add .
git commit -m "Blog auto-post: ${FILENAME}"
git push origin master
