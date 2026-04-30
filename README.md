# wechat-windows-versions

语言: [中文](#中文默认) | [English](#english) | [日本語](#日本語) | [한국어](#한국어) | [Русский](#русский) | [Français](#français) | [Español](#español)

## 中文（默认）

为避免项目和数据被和谐，且用且珍惜。

- [点击下载 Windows 微信历史版本](https://github.com/Rodert/wechat-win-versions)
- [点击下载 Mac 微信历史版本](https://github.com/Rodert/wechat-mac-versions)

### 项目简介

本项目用于收集并保存 Windows 微信历史版本。

项目使用 GitHub Actions 自动检查微信 Windows 版最新安装包，下载安装包，提取真实内部版本号，计算 SHA256，并发布到 GitHub Releases。

### 目录结构

```shell
├── README.md # 自述文件
├── WeChatSetup # 微信安装包临时目录
│   └── temp # 临时目录
└── scripts # 脚本目录
    └── destVersionRelease.sh # 获取安装包、提取版本号并计算 hash 的脚本
```

### 说明

当前脚本会从微信 Windows 官方页面获取下载链接，下载官方安装包，并解包读取安装包内部的真实版本号。例如官网文件名可能是 `WeChatWin_4.1.9.exe`，但安装包内部版本可能是 `4.1.9.30`。

注意：`3.5.0.46` 以下版本（不包含 `3.5.0.46`，且仅下载了一部分）均下载自 [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/)。

各版本更新日志可参见 [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true)。

### 在线访问

GitHub Pages 在线版本下载页面：访问仓库的 GitHub Pages（需要在仓库设置中启用）。

### 作者信息

- 作者：王仕宇 (Wang Shiyu)
- 自媒体：[JavaPub](https://github.com/Rodert) | 仕宇2046

如有问题或侵权，请直接提交 issue 告知。

## English

Use this project while it is still available.

- [Download historical WeChat for Windows versions](https://github.com/Rodert/wechat-win-versions)
- [Download historical WeChat for Mac versions](https://github.com/Rodert/wechat-mac-versions)

### Overview

This project archives historical versions of WeChat for Windows.

It uses GitHub Actions to automatically check the latest official WeChat for Windows installer, download it, extract the real internal version, calculate the SHA256 checksum, and publish the installer to GitHub Releases.

### Directory Structure

```shell
├── README.md # Readme file
├── WeChatSetup # Temporary installer directory
│   └── temp # Temporary directory
└── scripts # Script directory
    └── destVersionRelease.sh # Fetches the installer, extracts the version, and calculates the hash
```

### Notes

The current script fetches the download link from the official WeChat for Windows page, downloads the official installer, and extracts the real internal version from inside the installer. For example, the official filename may be `WeChatWin_4.1.9.exe`, while the internal installer version may be `4.1.9.30`.

Note: versions below `3.5.0.46` (excluding `3.5.0.46`, and only partially archived) were downloaded from [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Version changelogs are available at [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

### Online Access

GitHub Pages download page: visit this repository's GitHub Pages site after enabling GitHub Pages in the repository settings.

### Author

- Author: Wang Shiyu
- Media: [JavaPub](https://github.com/Rodert) | 仕宇2046

If there are any issues or infringement concerns, please open an issue.

## 日本語

このプロジェクトとデータが利用できるうちにご利用ください。

- [Windows 版 WeChat の過去バージョンをダウンロード](https://github.com/Rodert/wechat-win-versions)
- [Mac 版 WeChat の過去バージョンをダウンロード](https://github.com/Rodert/wechat-mac-versions)

### 概要

このプロジェクトは、Windows 版 WeChat の過去バージョンを収集し保存するためのものです。

GitHub Actions を使用して、Windows 版 WeChat の最新公式インストーラーを自動的に確認し、ダウンロード、実際の内部バージョン番号の抽出、SHA256 の計算を行い、GitHub Releases に公開します。

### ディレクトリ構成

```shell
├── README.md # README ファイル
├── WeChatSetup # インストーラー用の一時ディレクトリ
│   └── temp # 一時ディレクトリ
└── scripts # スクリプトディレクトリ
    └── destVersionRelease.sh # インストーラー取得、バージョン抽出、hash 計算用スクリプト
```

### 説明

現在のスクリプトは、WeChat for Windows の公式ページからダウンロードリンクを取得し、公式インストーラーをダウンロードして、インストーラー内部の実際のバージョン番号を読み取ります。たとえば、公式ファイル名が `WeChatWin_4.1.9.exe` でも、内部バージョンは `4.1.9.30` の場合があります。

注意：`3.5.0.46` より前のバージョン（`3.5.0.46` は含まず、一部のみ保存）は [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/) からダウンロードされています。

各バージョンの変更履歴は [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true) を参照してください。

### オンラインアクセス

GitHub Pages のダウンロードページ：リポジトリ設定で GitHub Pages を有効にするとアクセスできます。

### 作者

- 作者：王仕宇 (Wang Shiyu)
- メディア：[JavaPub](https://github.com/Rodert) | 仕宇2046

問題や権利侵害に関する連絡は、issue を作成してください。

## 한국어

이 프로젝트와 데이터는 이용 가능한 동안 사용해 주세요.

- [Windows WeChat 과거 버전 다운로드](https://github.com/Rodert/wechat-win-versions)
- [Mac WeChat 과거 버전 다운로드](https://github.com/Rodert/wechat-mac-versions)

### 개요

이 프로젝트는 Windows용 WeChat의 과거 버전을 수집하고 보관합니다.

GitHub Actions를 사용해 Windows용 WeChat의 최신 공식 설치 파일을 자동으로 확인하고, 다운로드한 뒤 실제 내부 버전 번호를 추출하고 SHA256을 계산하여 GitHub Releases에 게시합니다.

### 디렉터리 구조

```shell
├── README.md # README 파일
├── WeChatSetup # 설치 파일 임시 디렉터리
│   └── temp # 임시 디렉터리
└── scripts # 스크립트 디렉터리
    └── destVersionRelease.sh # 설치 파일 다운로드, 버전 추출, hash 계산 스크립트
```

### 설명

현재 스크립트는 WeChat for Windows 공식 페이지에서 다운로드 링크를 가져오고, 공식 설치 파일을 다운로드한 뒤 설치 파일 내부의 실제 버전 번호를 읽습니다. 예를 들어 공식 파일명이 `WeChatWin_4.1.9.exe` 일 수 있지만 내부 설치 버전은 `4.1.9.30` 일 수 있습니다.

주의: `3.5.0.46` 미만 버전(`3.5.0.46` 제외, 일부만 보관)은 [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/) 에서 다운로드되었습니다.

각 버전의 변경 내역은 [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true) 를 참고하세요.

### 온라인 접근

GitHub Pages 다운로드 페이지: 저장소 설정에서 GitHub Pages를 활성화한 뒤 접근할 수 있습니다.

### 작성자

- 작성자: 王仕宇 (Wang Shiyu)
- 미디어: [JavaPub](https://github.com/Rodert) | 仕宇2046

문제나 권리 침해 관련 사항이 있으면 issue를 열어 알려 주세요.

## Русский

Используйте проект и данные, пока они доступны.

- [Скачать архивные версии WeChat для Windows](https://github.com/Rodert/wechat-win-versions)
- [Скачать архивные версии WeChat для Mac](https://github.com/Rodert/wechat-mac-versions)

### Обзор

Этот проект собирает и хранит исторические версии WeChat для Windows.

GitHub Actions автоматически проверяет последний официальный установщик WeChat для Windows, скачивает его, извлекает реальную внутреннюю версию, вычисляет SHA256 и публикует файл в GitHub Releases.

### Структура Каталогов

```shell
├── README.md # Файл README
├── WeChatSetup # Временный каталог установщика
│   └── temp # Временный каталог
└── scripts # Каталог скриптов
    └── destVersionRelease.sh # Скрипт для загрузки установщика, извлечения версии и расчета hash
```

### Примечания

Текущий скрипт получает ссылку для скачивания с официальной страницы WeChat for Windows, скачивает официальный установщик и извлекает реальную внутреннюю версию из установщика. Например, официальный файл может называться `WeChatWin_4.1.9.exe`, но внутренняя версия установщика может быть `4.1.9.30`.

Примечание: версии ниже `3.5.0.46` (не включая `3.5.0.46`, и только частично архивированные) были скачаны с [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Журнал изменений версий доступен здесь: [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

### Онлайн-Доступ

Страница загрузки GitHub Pages: доступна после включения GitHub Pages в настройках репозитория.

### Автор

- Автор: Wang Shiyu
- Медиа: [JavaPub](https://github.com/Rodert) | 仕宇2046

Если есть проблемы или вопросы о нарушении прав, откройте issue.

## Français

Utilisez ce projet et ces données tant qu'ils sont disponibles.

- [Télécharger les anciennes versions de WeChat pour Windows](https://github.com/Rodert/wechat-win-versions)
- [Télécharger les anciennes versions de WeChat pour Mac](https://github.com/Rodert/wechat-mac-versions)

### Présentation

Ce projet archive les anciennes versions de WeChat pour Windows.

Il utilise GitHub Actions pour vérifier automatiquement le dernier installateur officiel de WeChat pour Windows, le télécharger, extraire sa véritable version interne, calculer son SHA256 et le publier dans GitHub Releases.

### Structure Du Projet

```shell
├── README.md # Fichier README
├── WeChatSetup # Répertoire temporaire de l'installateur
│   └── temp # Répertoire temporaire
└── scripts # Répertoire des scripts
    └── destVersionRelease.sh # Script de téléchargement, d'extraction de version et de calcul du hash
```

### Notes

Le script actuel récupère le lien de téléchargement depuis la page officielle de WeChat pour Windows, télécharge l'installateur officiel et extrait la véritable version interne depuis l'installateur. Par exemple, le nom officiel du fichier peut être `WeChatWin_4.1.9.exe`, tandis que la version interne peut être `4.1.9.30`.

Remarque : les versions antérieures à `3.5.0.46` (`3.5.0.46` exclue, et seulement partiellement archivées) ont été téléchargées depuis [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Les journaux de modifications sont disponibles ici : [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

### Accès En Ligne

Page de téléchargement GitHub Pages : accessible après activation de GitHub Pages dans les paramètres du dépôt.

### Auteur

- Auteur : Wang Shiyu
- Média : [JavaPub](https://github.com/Rodert) | 仕宇2046

En cas de problème ou de réclamation liée aux droits, veuillez ouvrir une issue.

## Español

Utiliza este proyecto y sus datos mientras sigan disponibles.

- [Descargar versiones históricas de WeChat para Windows](https://github.com/Rodert/wechat-win-versions)
- [Descargar versiones históricas de WeChat para Mac](https://github.com/Rodert/wechat-mac-versions)

### Descripción

Este proyecto archiva versiones históricas de WeChat para Windows.

Usa GitHub Actions para comprobar automáticamente el instalador oficial más reciente de WeChat para Windows, descargarlo, extraer la versión interna real, calcular el SHA256 y publicarlo en GitHub Releases.

### Estructura Del Proyecto

```shell
├── README.md # Archivo README
├── WeChatSetup # Directorio temporal del instalador
│   └── temp # Directorio temporal
└── scripts # Directorio de scripts
    └── destVersionRelease.sh # Script para descargar el instalador, extraer la versión y calcular el hash
```

### Notas

El script actual obtiene el enlace de descarga desde la página oficial de WeChat para Windows, descarga el instalador oficial y extrae la versión interna real desde el instalador. Por ejemplo, el nombre oficial del archivo puede ser `WeChatWin_4.1.9.exe`, mientras que la versión interna puede ser `4.1.9.30`.

Nota: las versiones anteriores a `3.5.0.46` (sin incluir `3.5.0.46`, y solo archivadas parcialmente) se descargaron desde [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Los registros de cambios están disponibles en [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

### Acceso En Línea

Página de descarga de GitHub Pages: disponible después de habilitar GitHub Pages en la configuración del repositorio.

### Autor

- Autor: Wang Shiyu
- Medio: [JavaPub](https://github.com/Rodert) | 仕宇2046

Si hay algún problema o reclamación relacionada con derechos, abre un issue.
