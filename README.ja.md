# wechat-windows-versions

言語: [中文](README.md) | [English](README.en.md) | 日本語 | [한국어](README.ko.md) | [Русский](README.ru.md) | [Français](README.fr.md) | [Español](README.es.md)

このプロジェクトとデータが利用できるうちにご利用ください。

- [Windows 版 WeChat の過去バージョンをダウンロード](https://github.com/Rodert/wechat-win-versions)
- [Mac 版 WeChat の過去バージョンをダウンロード](https://github.com/Rodert/wechat-mac-versions)

## 概要

このプロジェクトは、Windows 版 WeChat の過去バージョンを収集し保存するためのものです。

GitHub Actions を使用して、Windows 版 WeChat の最新公式インストーラーを自動的に確認し、ダウンロード、実際の内部バージョン番号の抽出、SHA256 の計算を行い、GitHub Releases に公開します。

## ディレクトリ構成

```shell
├── README.md # README ファイル
├── WeChatSetup # インストーラー用の一時ディレクトリ
│   └── temp # 一時ディレクトリ
└── scripts # スクリプトディレクトリ
    └── destVersionRelease.sh # インストーラー取得、バージョン抽出、hash 計算用スクリプト
```

## 説明

現在のスクリプトは、WeChat for Windows の公式ページからダウンロードリンクを取得し、公式インストーラーをダウンロードして、インストーラー内部の実際のバージョン番号を読み取ります。たとえば、公式ファイル名が `WeChatWin_4.1.9.exe` でも、内部バージョンは `4.1.9.30` の場合があります。

注意：`3.5.0.46` より前のバージョン（`3.5.0.46` は含まず、一部のみ保存）は [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/) からダウンロードされています。

各バージョンの変更履歴は [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true) を参照してください。

## オンラインアクセス

GitHub Pages のダウンロードページ：リポジトリ設定で GitHub Pages を有効にするとアクセスできます。

## 作者

- 作者：王仕宇 (Wang Shiyu)
- メディア：[JavaPub](https://github.com/Rodert) | 仕宇2046

問題や権利侵害に関する連絡は、issue を作成してください。
