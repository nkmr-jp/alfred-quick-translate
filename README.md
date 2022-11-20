[English](README.md) | [日本語](README_JA.md)

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Alfred Quick Translate](#alfred-quick-translate)
  - [Features](#features)
  - [Install](#install)
  - [Language and translation engine settings](#language-and-translation-engine-settings)
    - [When using DeepL](#when-using-deepl)
  - [Hotkey settings.](#hotkey-settings)
  - [Usage](#usage)
    - [When you want a quick translation](#when-you-want-a-quick-translation)
    - [When you want to translate and search on Google](#when-you-want-to-translate-and-search-on-google)
    - [When you want to select and translate text](#when-you-want-to-select-and-translate-text)

<!-- /code_chunk_output -->


# Alfred Quick Translate
- Translations for [Alfred 5](https://www.alfredapp.com/) Workflow. (*Powerpack is required.)
- This workflow uses [translate-shell](https://github.com/soimort/translate-shell).
- Icon is [iconfinder](https://www.iconfinder.com/icons/1249992/google_media_network_search_social_icon#size=128).
- You can choose a translation engine.
  - Google(default), DeepL
  - If you use DeepL, you need to register with [DeepL API](https://www.deepl.com/pro#developer) to get the key.
- You can now choose which language to translate into
  - Language code ([Google](https://github.com/soimort/translate-shell/wiki/Languages), [DeepL](https://www.deepl.com/docs-api/translating-text/))


## Features
Translate and paste the text

<img src="./screenshot/1.gif" width="700">

Translate and search directly

<img src="./screenshot/2.gif" width="700">

Selecting and translating text

<img src="./screenshot/3.gif" width="800">

Automatic saving of translated logs (`~/translate_log2.yml`)

<img src="./screenshot/996450EF-DA8F-4499-AB21-34925F9BB3BA.png" width="500">

Since the log file is in Yaml, you can parse it with the yq command.

```sh
$ brew install python-yq
$ cat  ~/translate2_log.yml | yq .
```

<img src="./screenshot/790CEFA3-2145-48EB-969F-D77EE3837DCD.png" width="500">

Automatically saves to the clipboard as well.<br>
The clipboard feature of Alfred is useful for searching the history.

<img src="./screenshot/2020-07-13_14.15.45.png" width="500">

No matter which features you use, the pre- and post-translation texts are stored in the log file, and it automatically saved the clipboard both.

## Install

1: Install [Alfred](https://www.alfredapp.com/), buy Powerpack and activate it.

2: Installing various commands

```shell
brew install translate-shell jq coreutils curl
```

3: Download `quick-translate.alfredworkflow` from [releases](https://github.com/nkmr-jp/alfred-quick-translate/releases)

<img src="./screenshot/ADC592D1-13C8-4981-BB53-3AC7A791EC1C.png" width="600">

4: Click on the downloaded `quick-translate.alfredworkflow` to open it and click on `import` to launch Alfred.

<img src="./screenshot/2020-07-13_10.55.02.png" width="400">

## Language and translation engine settings
After installing the workflow, click on the icon in the upper right corner to open the configuration screen. This screen allows you to select a translation engine and language. See `About the Workflow` on the left for more configuration information.


<img src="./screenshot/CA161D10-6685-4D2C-AF51-9D8F9DE6C28A.png" width="800">

### When using DeepL
1. Register with [DeepL API](https://www.deepl.com/pro#developer) to get the API key.
2. Type `deepl` in the `engine` and Enter the  API key in the `deepl_api_key`.

## Hotkey settings.
From Workflows in Alfred's Preferences When you open `Quick Translate`, you can set a hotkey for each feature like this.
Initially, Hotkey is blank, so you can assign a key of your choice and use it

<img src="./screenshot/DC3E49BD-05A0-448D-BC87-D5708230AC77.png" width="500">


## Usage
### When you want a quick translation
Launch the translation launcher with the key you assigned in the Hotkey settings. As you type in the text, it translates in real-time. 
You can press `Enter` to paste the translation into an editor.

<img src="./screenshot/1.gif" width="700">


### When you want to translate and search on Google

Launch the translation launcher with the key you assigned in the Hotkey settings.
After typing the text in the translation launcher,
You can Google the translated text with `cmd + Enter`.

<img src="./screenshot/2.gif" width="700">


### When you want to select and translate text
Select the text you want to translate and enter the key you assigned to Hotkey.

<img src="./screenshot/3.gif" width="800">

When in the browser, you can use Google Translate. 
But if you use Alfred Quick Transrate, when you want to read comments on the source code of not the native language, and useful when you want to translate chat messages and so on immediately.

