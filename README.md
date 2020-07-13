# Alfred Quick Translate
- [Alfred 4](https://www.alfredapp.com/) 対応の翻訳ワークフローです。(※有料のPowerpack が必要です。)
- [translate-shell](https://github.com/soimort/translate-shell) を使っています。
- iconは[iconfinder](https://www.iconfinder.com/icons/1249992/google_media_network_search_social_icon#size=128)で探しました。
- 翻訳エンジンを選択できます。(8翻訳エンジンから選択できます)
  - google(デフォルト,おすすめ), deepl(おすすめ)
  - aspell, bing, spell, hunspell, apertium, yandex
  - ※ DeepLを使う場合は [DeepL Pro](https://www.deepl.com/pro#developer) に登録してAPIキーを取得する必要があります。
- 翻訳する言語を選択できるようになりました(100言語以上対応)
  - 言語コード([DeepL](https://www.deepl.com/docs-api/translating-text/), [その他](https://github.com/soimort/translate-shell/wiki/Languages))


## 機能
翻訳してテキストを貼り付け

<img src="./screenshot/1.gif" width="700">

翻訳してそのまま検索

<img src="./screenshot/2.gif" width="700">

テキストを選択して翻訳

<img src="./screenshot/3.gif" width="800">

翻訳したログの自動保存 (`~/translate_log2.yml`)

<img src="./screenshot/2017-03-1313.35.09.png" width="500">

クリップボードにも自動で保存<br>
Alfredのクリップボード機能を使うと履歴を検索できるので便利です。

<img src="./screenshot/2017-03-1313.38.05.png" width="500">

どの機能を使っても、翻訳前、翻訳後のテキストは<br>
ログファイルとクリップボードの両方に自動で保存されます。

## インストール

1:  [Alfred](https://www.alfredapp.com/) をインストールし、Powerpackを購入してライセンス認証。

2:  [translate-shell](https://github.com/soimort/translate-shell) をインストール。

```shell
brew install translate-shell
```

3: [quick-translate.alfredworkflow](https://github.com/nkmr-jp/alfred-quick-translate/releases/download/1.0/quick-translate.alfredworkflow) をダウンロード

4: ダウンロードした `quick-translate.alfredworkflow` をクリックして開くとAlfredが起動するので`import`をクリック。

<img src="./screenshot/2017-03-1311.52.08.png" width="400">

## Hotkeyの設定
AlfredのPreferencesのWorkflowsからQuick Translateを開くとこのように各機能のHotkeyが設定できます。<br>
初期の状態ではHotkeyは空白ですのでお好みのキーを割り当てて使ってください。<br>
以下の画像の設定だと。

- `alt + s` : 日本語 → 英語 の翻訳ランチャーが起動
- `alt + cmd + s` : 英語 → 日本語 の翻訳ランチャーが起動
- `alt + cmd + z` : 選択した日本語のテキストを英語に変換する。
- `alt + z` : 選択した英語のテキストを日本語に変換する。

となります。

<img src="./screenshot/2017-03-1310.44.54.png" width="500">


## 使い方
### サクッと翻訳したい
Hotkeyの設定で割り当てたキーで翻訳ランチャーを起動します。<br>
文字を入力するとリアルタイムで翻訳されます。<br>
`Enter` を押すと、翻訳結果をエディタなどに貼り付けられます。

<img src="./screenshot/1.gif" width="700">


### 翻訳してGoogleで検索したい
Hotkeyの設定で割り当てたキーで翻訳ランチャーを起動します。<br>
翻訳ランチャーでテキストを入力後<br>
`ctrl + Enter` で翻訳後のテキストでググれます。

<img src="./screenshot/2.gif" width="700">


### テキストを選択して翻訳したい

翻訳したいテキストを選択して、Hotkeyに割り当てたキーを入力します。

<img src="./screenshot/3.gif" width="800">

ブラウザだとGoogle翻訳の拡張機能などが使えますが、<br>
たとえばソースコード上の英語コメントやコマンドの`--help` などをすぐ翻訳したいときにも使えて便利です。
