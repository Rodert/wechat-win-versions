# wechat-windows-versions

Языки: [中文](README.md) | [English](README.en.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | Русский | [Français](README.fr.md) | [Español](README.es.md)

Используйте проект и данные, пока они доступны.

- [Скачать архивные версии WeChat для Windows](https://github.com/Rodert/wechat-win-versions)
- [Скачать архивные версии WeChat для Mac](https://github.com/Rodert/wechat-mac-versions)

## Обзор

Этот проект собирает и хранит исторические версии WeChat для Windows.

GitHub Actions автоматически проверяет последний официальный установщик WeChat для Windows, скачивает его, извлекает реальную внутреннюю версию, вычисляет SHA256 и публикует файл в GitHub Releases.

## Структура Каталогов

```shell
├── README.md # Файл README
├── WeChatSetup # Временный каталог установщика
│   └── temp # Временный каталог
└── scripts # Каталог скриптов
    └── destVersionRelease.sh # Скрипт для загрузки установщика, извлечения версии и расчета hash
```

## Примечания

Текущий скрипт получает ссылку для скачивания с официальной страницы WeChat for Windows, скачивает официальный установщик и извлекает реальную внутреннюю версию из установщика. Например, официальный файл может называться `WeChatWin_4.1.9.exe`, но внутренняя версия установщика может быть `4.1.9.30`.

Примечание: версии ниже `3.5.0.46` (не включая `3.5.0.46`, и только частично архивированные) были скачаны с [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Журнал изменений версий доступен здесь: [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

## Онлайн-Доступ

Страница загрузки GitHub Pages: доступна после включения GitHub Pages в настройках репозитория.

## Автор

- Автор: Wang Shiyu
- Медиа: [JavaPub](https://github.com/Rodert) | 仕宇2046

Если есть проблемы или вопросы о нарушении прав, откройте issue.
