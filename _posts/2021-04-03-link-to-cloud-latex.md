---
layout: article
title: "VSCodeとCloud LaTeXの連携"
permalink: /posts/link-to-cloud-latex
author: shiba
date:   2021-04-03 14:00:00 +0900
modify_date: 
tags: VSCode LaTeX
---

## 要約

- Viual Studio Codeの拡張機能[Cloud LaTeX Extension for Visual Studio Code](https://github.com/cloudlatex-team/cloudlatex-vscode-extension)を使ってCloud LaTeXとVSCodeを連携します．
- Cloud LaTeXのプロジェクトにあるファイルを，ローカルPCのVSCodeで編集できるようになります．
- Cloud LaTeXは2021年4月3日現在開発中です．

## 導入背景

[Cloud LaTeX](https://cloudlatex.io/)はクラウド上でlatexを使ってpdfファイルを作成できるサービスです．texファイルを編集するエディタもウェブブラウザ上で動作します．長大なlatexのプログラムをローカルPCにインストールせずに使うことができるのが利点です．

[Visual Studio Code](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)は最も人気のあるエディタの一つで，様々なサービスとの連携や拡張性・カスタマイズ性の高さが特徴です．

気軽にlatexを使いたい．そしてtexファイルはクラウド上に保持したい．しかし備え付けのエディタではなくVSCodeを使いたい．そんな願いをかなえてくれるのが今回紹介する拡張機能です．


この拡張機能を使うことで，ローカルPC上で編集したファイルをCloud LaTeXのプロジェクトに同期することができます．Cloud LaTeXではlatexファイルをコンパイルしてpdfを出力してくれるので，すぐにpdfで出力を確認することができます．

## 実際の手順

### ステップ 1 Cloud LaTeXに登録

まずは公式ホームページからログインまたはサインアップします．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-entry.png)
![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-login.png)

- メールアドレスから登録，
- facebook, twitter, googleアカウントとリンク

のいずれかを選びます．

他のサービスと連携してアカウントを作成した人は別途パスワード登録をする必要があります．

一度ログアウトし，ログイン画面にある`パスワード再設定`をクリックして誘導に従ってください．

### ステップ 2 新しいプロジェクトを作成

ユーザーのマイページから`新規作成`を選択し，新しいプロジェクトを作ります．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-new-project-button.png)

今回は`Sample`というプロジェクトを作ります．プロジェクト名は任意の文字列で代替可能です．
![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-new-project.png)

次に，プロジェクトを開き，ブラウザのヘッダーからProject IDを読み取ります．

urlの`/projects`以下の数字がProject IDです．

この例では`343112`となっています．この値も今後つかいので保存しておきましょう．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-project-url.png)

### ステップ 3 クライアントIDとトークンを取得

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-extention.png)

右上のユーザーから`拡張機能`を選択します．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-generate-token.png)

パスワードの入力を求められるので，入力します．

次にトークンを生成をクリックします．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-token.png)

Client IDとtokenはあとで必要になるので別のテキストファイルなどにコピー&ペーストで一次的に保存しておきます．


### ステップ 4 VSCodeに拡張機能を導入

VSCodeのサイドーバーの拡張機能のアイコンをクリックし，検索窓に`cloud latex`と入力します．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-vscode-sidebar.png)


`install`ボタンからインストールします．

### ステップ 5 ワークスペースを作成

Cloud LaTeXの拡張機能にはワークスペースが必要なので，なければ`hoge.code-workspace`という名前で空のファイルを作成します．`hoge`の部分は任意の文字列で代替可能です．

今回はCloud LaTeXのプロジェクトのファイル群を同期させるために```Cloud LaTeX```というフォルダを作成しました．その中に`hoge.code-workspace`というファイルがあります．

フォルダ構成は
```
Cloud LaTeX
  └─ hoge.code-workspace
```
となっています．

まずVSCodeで`Cloud LaTeX`というフォルダを開きます．このフォルダはワークスペースファイルよりも上の階層にあれば，どこでも良いです．
次に「ワークスペースを開く」で`hoge.code-workspace`を開きます．

### ステップ 6 拡張機能の設定

VSCodeの拡張機能が並んでいる左のバーから`CL`をクリックし，`Set account`をクリックするとメールアドレスを入力するバーが出ます．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-vscode-setting.png)


ここにCloud LaTeXで登録したメールアドレスを入力します．このときパスワードを設定していないとエラーになります．

次にClient IDを入力して`Enter`を押します．もし保存忘れてしまったら，もう一度同じ手順で作り直してください．

次にtokenを入力して`Enter`を押します．

認証が成功すると右下にポップアップが出ます．

次にproject settingのWorkplaceタブにある設定を変更します．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-vscode-projectsetting.png)

- Cloudlatex: **Enabled** にチェック
- Cloudlatex: **Project ID**にプロジェクトIDを入力します．

変更するとリロードを促すポップアップが出るのでリロードします．

左側がProject setting (Sample)となれば成功です．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-vscode-success.png)

反映されない場合は何度か`Reload`を押してみましょう．

成功するとCloud LaTeXというフォルダに，新たに

- figures
- main.pdf
- main.tex

などのフォルダとファイルができます．

## 同期できるかの確認

### クラウドからローカル

まずクラウド上で編集したファイルが同期されているか確かめましょう．

Cloud LaTeXのサービスから，`main.tex`というファイルの35行目に文字列を加えました．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-cloud-change.png)

クラウドで編集した後ローカルで`Reload`を押すと次のようになります．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-cloud-check-2.png)

### ローカルからクラウド

次にローカルで編集した箇所がクラウドに反映されることを確かめましょう．

VSCodeの編集画面で`main.tex`というファイルの36行目に文字列を加えました．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-local-change.png)

ブラウザをリロードすると次のようになります．

![](https://raw.githubusercontent.com/ynu-math/ynu-math.github.io/gh-pages/assets/images/topics/cloudlatex/cloud-latex-cloud-check.png)


## まとめ

この記事ではCloud LaTeXをVSCodeに連携する方法を紹介しました．これにより，texファイルをクラウドに保持しつつ，好きなエディタでtexファイルを編集することができます．

### 注意

開発ページの[README](https://github.com/cloudlatex-team/cloudlatex-vscode-extension/blob/master/docs/README_ja.md)にある通り，開発中の機能です．重要なプロジェクトには使用しないでください．
