# wechat-windows-versions

Idiomas: [中文](README.md) | [English](README.en.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [Русский](README.ru.md) | [Français](README.fr.md) | Español

Utiliza este proyecto y sus datos mientras sigan disponibles.

- [Descargar versiones históricas de WeChat para Windows](https://github.com/Rodert/wechat-win-versions)
- [Descargar versiones históricas de WeChat para Mac](https://github.com/Rodert/wechat-mac-versions)

## Descripción

Este proyecto archiva versiones históricas de WeChat para Windows.

Usa GitHub Actions para comprobar automáticamente el instalador oficial más reciente de WeChat para Windows, descargarlo, extraer la versión interna real, calcular el SHA256 y publicarlo en GitHub Releases.

## Estructura Del Proyecto

```shell
├── README.md # Archivo README
├── WeChatSetup # Directorio temporal del instalador
│   └── temp # Directorio temporal
└── scripts # Directorio de scripts
    └── destVersionRelease.sh # Script para descargar el instalador, extraer la versión y calcular el hash
```

## Notas

El script actual obtiene el enlace de descarga desde la página oficial de WeChat para Windows, descarga el instalador oficial y extrae la versión interna real desde el instalador. Por ejemplo, el nombre oficial del archivo puede ser `WeChatWin_4.1.9.exe`, mientras que la versión interna puede ser `4.1.9.30`.

Nota: las versiones anteriores a `3.5.0.46` (sin incluir `3.5.0.46`, y solo archivadas parcialmente) se descargaron desde [web.archive.org](https://web.archive.org/web/*/https://pc.weixin.qq.com/).

Los registros de cambios están disponibles en [changelog](https://weixin.qq.com/cgi-bin/readtemplate?lang=zh_CN&t=weixin_faq_list&head=true).

## Acceso En Línea

Página de descarga de GitHub Pages: disponible después de habilitar GitHub Pages en la configuración del repositorio.

## Autor

- Autor: Wang Shiyu
- Medio: [JavaPub](https://github.com/Rodert) | 仕宇2046

Si hay algún problema o reclamación relacionada con derechos, abre un issue.
