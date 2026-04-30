# wechat-windows-versions

Languages: [中文](README.md) | English | [日本語](README.ja.md) | [한국어](README.ko.md) | [Русский](README.ru.md) | [Français](README.fr.md) | [Español](README.es.md)

Use this project while it is still available.

- [Download historical WeChat for Windows versions](https://github.com/Rodert/wechat-win-versions)
- [Download historical WeChat for Mac versions](https://github.com/Rodert/wechat-mac-versions)

## Overview

This project archives historical versions of WeChat for Windows.

It uses GitHub Actions to automatically check the latest official WeChat for Windows installer, download it, extract the real internal version, calculate the SHA256 checksum, and publish the installer to GitHub Releases.

## Directory Structure

```shell
├── README.md # Readme file
├── WeChatSetup # Temporary installer directory
│   └── temp # Temporary directory
└── scripts # Script directory
    └── destVersionRelease.sh # Fetches the installer, extracts the version, and calculates the hash
```

## Notes

The current script fetches the download link from the official WeChat for Windows page, downloads the official installer, and extracts the real internal version from inside the installer. For example, the official filename may be `WeChatWin_4.1.9.exe`, while the internal installer version may be `4.1.9.30`.

Note: versions below `3.5.0.46` (excluding `3.5.0.46`, and only partially archived) were downloaded from [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Version changelogs are available at [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

## Online Access

GitHub Pages download page: visit this repository's GitHub Pages site after enabling GitHub Pages in the repository settings.

## Author

- Author: Wang Shiyu
- Media: [JavaPub](https://github.com/Rodert) | 仕宇2046

If there are any issues or infringement concerns, please open an issue.
