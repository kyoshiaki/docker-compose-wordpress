#!/bin/sh

#
# 2021/11/22(Mon) 23:34:49
#
#　WordPress の URL が https://xxxxx.sakura.ne.jp/wp/ の場合
#
# rsync コマンドを使って
# さくらインターネットのさくらのレンタルサーバ /home/xxxxx/www/wp ディレクトリをカレントディレクトリにコピーする。
#  
# ssh の設定が必要。
#
# カレントディレクトリに wp フォルダが作成される。
#
# ファイル ignore にコピーしないファイルを指定する。
#

SOURCE="xxxxx@xxxxx.sakura.ne.jp:/home/xxxxx/www/wp"
TARGET="."

HCD=$(pwd)

echo "rsync --exclude-from=ignore -r $SOURCE $TARGET"
rsync --exclude-from=ignore -r "$SOURCE" .

