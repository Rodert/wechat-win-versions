# wechat-windows-versions

语言: 中文 | [English](README.en.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Русский](README.ru.md) | [Français](README.fr.md) | [Español](README.es.md)

为避免项目和数据被和谐，且用且珍惜。

- [点击下载 Windows 微信历史版本](https://github.com/Rodert/wechat-win-versions)
- [点击下载 Mac 微信历史版本](https://github.com/Rodert/wechat-mac-versions)

## 项目简介

本项目用于收集并保存 Windows 微信历史版本。

项目使用 GitHub Actions 自动检查微信 Windows 版最新安装包，下载安装包，提取真实内部版本号，计算 SHA256，并发布到 GitHub Releases。

## 目录结构

```shell
├── README.md # 自述文件
├── WeChatSetup # 微信安装包临时目录
│   └── temp # 临时目录
└── scripts # 脚本目录
    └── destVersionRelease.sh # 获取安装包、提取版本号并计算 hash 的脚本
```

## 说明

当前脚本会从微信 Windows 官方页面获取下载链接，下载官方安装包，并解包读取安装包内部的真实版本号。例如官网文件名可能是 `WeChatWin_4.1.9.exe`，但安装包内部版本可能是 `4.1.9.30`。

注意：`3.5.0.46` 以下版本（不包含 `3.5.0.46`，且仅下载了一部分）均下载自 [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/)。

各版本更新日志可参见 [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true)。

## 在线访问

GitHub Pages 在线版本下载页面：访问仓库的 GitHub Pages（需要在仓库设置中启用）。

## 作者信息

- 作者：王仕宇 (Wang Shiyu)
- 自媒体：[JavaPub](https://github.com/Rodert) | 仕宇2046

如有问题或侵权，请直接提交 issue 告知。
