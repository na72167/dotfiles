#!/bin/bash

### メモ
#さきにApp storeにログインしておく
#install.shを実行しておく

### 不可視ファイルを可視化する(再起動したら見える)
echo "不可視ファイルを可視化します"
defaults write com.apple.finder AppleShowAllFiles TRUE

### Command Line Tools
echo "Command Line Tools for Xcodeのインストールをします"
xcode-select --install


### homebrew
echo "homebrewをインストールしています"
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew doctorを実行しています"
which brew >/dev/null 2>&1 && brew doctor

echo "run brew updateを行います"
which brew >/dev/null 2>&1 && brew update --verbose

echo "homebrew周りの設定が終了しました"

### .Brewfileに記載されているアプリをインストール
echo ".Brewfileに記載されているアプリをインストールします"
brew bundle --global --verbose

### fishシェルに切り替える
# この記事が書かれた時点ではBigSurのデフォルトshellがbashだった為
# (2021/06/16時点だとBigSurの場合だとzsh)
# 上手く動かないと思う。

# 参考記事
# macの環境構築を簡単にするためにdotfileを作った
# https://qiita.com/nakagawa1017/items/a11599938a6cb0db0dad

# シェルスクリプトをデバッグするには
# ihttps://www.atmarkit.co.jp/flinux/rensai/linuxtips/784debugsh.html