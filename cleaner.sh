#!/bin/bash
# 設定例. (1時間ごとに削除する)
# crontab -e 
# * */1 * * * /home/tikisi/.bin/cleaner.sh


# ゴミ箱ディレクトリ
TRASH_DIR="$HOME/.trash"

# 削除期間
DAYS=10

# 指定された日数以上経過したファイルを削除
find "$TRASH_DIR" -type f -mtime +$DAYS -exec rm {} \;
