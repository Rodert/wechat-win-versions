# wechat-windows-versions

언어: [中文](README.md) | [English](README.en.md) | [日本語](README.ja.md) | 한국어 | [Русский](README.ru.md) | [Français](README.fr.md) | [Español](README.es.md)

이 프로젝트와 데이터는 이용 가능한 동안 사용해 주세요.

- [Windows WeChat 과거 버전 다운로드](https://github.com/Rodert/wechat-win-versions)
- [Mac WeChat 과거 버전 다운로드](https://github.com/Rodert/wechat-mac-versions)

## 개요

이 프로젝트는 Windows용 WeChat의 과거 버전을 수집하고 보관합니다.

GitHub Actions를 사용해 Windows용 WeChat의 최신 공식 설치 파일을 자동으로 확인하고, 다운로드한 뒤 실제 내부 버전 번호를 추출하고 SHA256을 계산하여 GitHub Releases에 게시합니다.

## 디렉터리 구조

```shell
├── README.md # README 파일
├── WeChatSetup # 설치 파일 임시 디렉터리
│   └── temp # 임시 디렉터리
└── scripts # 스크립트 디렉터리
    └── destVersionRelease.sh # 설치 파일 다운로드, 버전 추출, hash 계산 스크립트
```

## 설명

현재 스크립트는 WeChat for Windows 공식 페이지에서 다운로드 링크를 가져오고, 공식 설치 파일을 다운로드한 뒤 설치 파일 내부의 실제 버전 번호를 읽습니다. 예를 들어 공식 파일명이 `WeChatWin_4.1.9.exe` 일 수 있지만 내부 설치 버전은 `4.1.9.30` 일 수 있습니다.

주의: `3.5.0.46` 미만 버전(`3.5.0.46` 제외, 일부만 보관)은 [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/) 에서 다운로드되었습니다.

각 버전의 변경 내역은 [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true) 를 참고하세요.

## 온라인 접근

GitHub Pages 다운로드 페이지: 저장소 설정에서 GitHub Pages를 활성화한 뒤 접근할 수 있습니다.

## 작성자

- 작성자: 王仕宇 (Wang Shiyu)
- 미디어: [JavaPub](https://github.com/Rodert) | 仕宇2046

문제나 권리 침해 관련 사항이 있으면 issue를 열어 알려 주세요.
