# wechat-windows-versions

Langues : [中文](README.md) | [English](README.en.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Русский](README.ru.md) | Français | [Español](README.es.md)

Utilisez ce projet et ces données tant qu'ils sont disponibles.

- [Télécharger les anciennes versions de WeChat pour Windows](https://github.com/Rodert/wechat-win-versions)
- [Télécharger les anciennes versions de WeChat pour Mac](https://github.com/Rodert/wechat-mac-versions)

## Présentation

Ce projet archive les anciennes versions de WeChat pour Windows.

Il utilise GitHub Actions pour vérifier automatiquement le dernier installateur officiel de WeChat pour Windows, le télécharger, extraire sa véritable version interne, calculer son SHA256 et le publier dans GitHub Releases.

## Structure Du Projet

```shell
├── README.md # Fichier README
├── WeChatSetup # Répertoire temporaire de l'installateur
│   └── temp # Répertoire temporaire
└── scripts # Répertoire des scripts
    └── destVersionRelease.sh # Script de téléchargement, d'extraction de version et de calcul du hash
```

## Notes

Le script actuel récupère le lien de téléchargement depuis la page officielle de WeChat pour Windows, télécharge l'installateur officiel et extrait la véritable version interne depuis l'installateur. Par exemple, le nom officiel du fichier peut être `WeChatWin_4.1.9.exe`, tandis que la version interne peut être `4.1.9.30`.

Remarque : les versions antérieures à `3.5.0.46` (`3.5.0.46` exclue, et seulement partiellement archivées) ont été téléchargées depuis [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Les journaux de modifications sont disponibles ici : [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

## Accès En Ligne

Page de téléchargement GitHub Pages : accessible après activation de GitHub Pages dans les paramètres du dépôt.

## Auteur

- Auteur : Wang Shiyu
- Média : [JavaPub](https://github.com/Rodert) | 仕宇2046

En cas de problème ou de réclamation liée aux droits, veuillez ouvrir une issue.
