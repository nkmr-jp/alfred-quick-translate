# 概要
- Alfred 3 対応のGoogle翻訳ワークフローです。
- 今のところ日↔英のみ対応しています。 
- [Alfred 3](https://www.alfredapp.com/) Powerpack が必要です。
- [translate-shell](https://github.com/soimort/translate-shell) を使っています。
- 機能
    - 翻訳してテキストを貼り付け
    - 翻訳して検索 
    - テキストを選択して翻訳 
    - 翻訳履歴のログ保存とクリップボードへのコピー
    
# インストール

1:  [Alfred 3](https://www.alfredapp.com/) Powerpack を購入してインストール。

2:  [translate-shell](https://github.com/soimort/translate-shell) をインストール。

    ```shell
    git clone https://github.com/soimort/translate-shell
    cd translate-shell/
    make    
    [sudo] make install
    ```
3: [quick-translate.alfredworkflow](https://github.com/nkmr-jp/alfred-quick-translate/releases/download/1.0/quick-translate.alfredworkflow) をダウンロード

4: ダウンロードした `quick-translate.alfredworkflow` をクリックして開くとAlfredが起動するので`import`をクリック。

# Hotkeyの設定
AlfredのPreferencesのWorkflowからQuick Translateを開くとこのように各機能のHotkeyが設定できます。<br>
初期の状態ではHotkeyは空白ですのでお好みのキーを割り当てて使ってください。
以下の画像の設定だと。

- `alt + s` : 日本語 → 英語 の翻訳ランチャーが起動
- `alt + cmd + s` : 英語 → 日本語 の翻訳ランチャーが起動
- `alt + cmd + z` : 選択した日本語のテキストを英語に変換する。
- `alt + z` : 選択した英語のテキストを日本語に変換する。

となります。

<img src="./screenshot/2017-03-1310.44.54.png" width="500">


# 使い方
## サクッと翻訳したい
Hotkeyの設定で割り当てたキーで翻訳ランチャーを起動します。<br>
文字を入力するとリアルタイムで翻訳されます。<br>
エンターキーを押すと、翻訳結果をエディタなどに貼り付けられます。

## 翻訳してGoogleで検索したい
Hotkeyの設定で割り当てたキーで翻訳ランチャーを起動します。<br>
翻訳ランチャーでテキストを入力後<br>
`ctrl + Enter` で翻訳後のテキストでググれます。

## テキストを選択して翻訳したい

翻訳したいテキストを選択して、Hotkeyを入力します。

# 翻訳ログとクリップボードについて

どの機能を使っても、翻訳前、翻訳後のテキストは<br>
ログファイルとクリップボードの両方に自動で保存されます。

- 翻訳したログは ~/translate_log.yml に保存されます。
- クリップボードはAlfredのクリップボード機能を使うと履歴を検索できるので便利です。


