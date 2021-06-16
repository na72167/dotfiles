#!/bin/bash
## 導入メモ
# https://qiita.com/nakagawa1017/items/b0ac953f3448a46899fb

## /etc/shellsファイルに「/usr/local/bin/fish」を一番下に入れる
### メモ：pwを要求される
sudo sh -c "echo /usr/local/bin/fish >> /etc/shells"

## デフォルトシェルを fish に変更
### メモ：pwを要求される
echo "デフォルトシェルを fish に変更"
chsh -s /usr/local/bin/fish

## ログインシェルを起動
echo "ログインシェルを起動"
fish -l

# fishでnodeをインストールする際に最後パスを通す必要があるのでこれもシェルの中に組み込む。
# set -x PATH $HOME/.nodebrew/current/bin $PATH