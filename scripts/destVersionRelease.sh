#!/usr/bin/env bash

set -Eeuo pipefail

temp_path="WeChatSetup/temp"
installer_path="${temp_path}/WeChatSetup.exe"
release_dir=""
dest_version=""
download_link="${1:-${DOWNLOAD_LINK:-}}"
official_last_modified=""
now_sum256=""

function section() {
    >&2 printf "#%.0s" {1..60}
    >&2 echo
    >&2 echo -e "## \033[1;33m$1\033[0m"
    >&2 printf "#%.0s" {1..60}
    >&2 echo
}

function require_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        >&2 echo -e "\033[1;31mMissing required command: $1\033[0m"
        exit 1
    fi
}

function get_download_link_from_official() {
    section "Fetching download link from https://pc.weixin.qq.com/"

    local page_content
    page_content=$(curl -fsSL "https://pc.weixin.qq.com/")

    local link
    link=$(printf '%s' "$page_content" | grep -oE 'https://dldir1v6\.qq\.com/weixin/Universal/Windows/[^"'"'"'<>[:space:]]+\.exe' | head -1 || true)

    if [ -z "$link" ]; then
        link=$(printf '%s' "$page_content" | grep -i 'id="downloadButton"' | sed -E 's/.*id="downloadButton"[^>]*href="([^"]*)".*/\1/' | head -1 || true)
    fi

    if [ -z "$link" ]; then
        local filename
        filename=$(printf '%s' "$page_content" | grep -oE 'WeChatWin_[0-9.]+\.exe' | head -1 || true)
        if [ -n "$filename" ]; then
            link="https://dldir1v6.qq.com/weixin/Universal/Windows/$filename"
        fi
    fi

    if [ -z "$link" ]; then
        >&2 echo -e "\033[1;31mCould not extract download link from official website!\033[0m"
        return 1
    fi

    echo "$link"
}

function get_last_modified() {
    curl -fsSIL "$download_link" \
        | awk 'BEGIN { IGNORECASE=1 } /^last-modified:/ { sub(/\r$/, ""); sub(/^[^:]+:[[:space:]]*/, ""); value=$0 } END { print value }'
}

function login_gh() {
    section "Preparing GitHub authentication"

    if [ -n "${GH_TOKEN:-}" ]; then
        return 0
    fi

    if [ -n "${GHTOKEN:-}" ]; then
        export GH_TOKEN="$GHTOKEN"
        return 0
    fi

    if gh auth status >/dev/null 2>&1; then
        return 0
    fi

    >&2 echo -e "\033[1;31mMissing GitHub token. Set GH_TOKEN or GHTOKEN.\033[0m"
    exit 1
}

function download_wechat() {
    section "Downloading the newest WeChat installer"

    mkdir -p "$temp_path"
    curl -fL --retry 3 --retry-delay 5 "$download_link" -o "$installer_path"
}

function extract_version_from_dirs() {
    local search_dir="$1"

    find "$search_dir" -type d -printf '%f\n' \
        | sed -nE 's/^\[?([0-9]+(\.[0-9]+){2,})\]?$/\1/p' \
        | sort -V \
        | tail -1
}

function extract_version() {
    section "Extracting the full internal WeChat version"

    local exe_dir="${temp_path}/exe"
    local install_dir="${temp_path}/install"
    rm -rf "$exe_dir" "$install_dir"
    mkdir -p "$exe_dir" "$install_dir"

    7z x "$installer_path" "-o${exe_dir}" -y >/dev/null

    if [ -f "${exe_dir}/install.7z" ]; then
        7z x "${exe_dir}/install.7z" "-o${install_dir}" -y >/dev/null
        dest_version=$(extract_version_from_dirs "$install_dir" || true)
    fi

    if [ -z "$dest_version" ]; then
        dest_version=$(extract_version_from_dirs "$exe_dir" || true)
    fi

    if [ -z "$dest_version" ]; then
        dest_version=$(7z l "$installer_path" | grep -oE '\[?[0-9]+(\.[0-9]+){2,}\]?' | sed -e 's/\[//g' -e 's/\]//g' | sort -V | tail -1 || true)
    fi

    if [ -z "$dest_version" ]; then
        dest_version=$(printf '%s' "$download_link" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+(\.[0-9]+)?' | head -1 || true)
    fi

    if [ -z "$dest_version" ]; then
        >&2 echo -e "\033[1;31mFailed to extract version number!\033[0m"
        >&2 find "$temp_path" -maxdepth 3 -type d -print || true
        exit 1
    fi

    >&2 echo -e "\033[1;32mExtracted version: $dest_version\033[0m"
}

function latest_release_sha() {
    local body
    if ! body=$(gh release view --json body --jq ".body" 2>/dev/null); then
        echo ""
        return 0
    fi

    printf '%s\n' "$body" | awk 'BEGIN { IGNORECASE=1 } /^sha256[[:space:]]*:/ { print $2; exit }'
}

function release_sha_for_version() {
    local body
    if ! body=$(gh release view "v${dest_version}" --json body --jq ".body" 2>/dev/null); then
        echo ""
        return 0
    fi

    printf '%s\n' "$body" | awk 'BEGIN { IGNORECASE=1 } /^sha256[[:space:]]*:/ { print $2; exit }'
}

function prepare_release() {
    section "Preparing release files"

    release_dir="WeChatSetup/${dest_version}"
    mkdir -p "$release_dir"

    local asset_path="${release_dir}/WeChatSetup-${dest_version}.exe"
    local note_path="${release_dir}/WeChatSetup-${dest_version}.exe.sha256"

    cp "$installer_path" "$asset_path"

    {
        echo "Version: $dest_version"
        echo "DestVersion: $dest_version"
        echo "Download URL: $download_link"
        echo "DownloadFrom: $download_link"
        echo "SHA256: $now_sum256"
        echo "Sha256: $now_sum256"
        echo "Last Modified: $official_last_modified"
        echo "UpdateTime: $(date -u '+%Y-%m-%d %H:%M:%S') (UTC)"
    } > "$note_path"
}

function publish_release() {
    section "Publishing GitHub release v${dest_version}"

    local asset_path="${release_dir}/WeChatSetup-${dest_version}.exe"
    local note_path="${release_dir}/WeChatSetup-${dest_version}.exe.sha256"

    if gh release view "v${dest_version}" >/dev/null 2>&1; then
        gh release upload "v${dest_version}" "$asset_path" --clobber
        gh release edit "v${dest_version}" -F "$note_path" -t "Wechat v${dest_version}"
    else
        gh release create "v${dest_version}" "$asset_path" -F "$note_path" -t "Wechat v${dest_version}"
    fi
}

function clean_data() {
    section "Cleaning runtime files"
    rm -rf "$temp_path"
    if [ -n "$release_dir" ]; then
        rm -rf "$release_dir"
    fi
}

function main() {
    require_command curl
    require_command gh
    require_command 7z
    require_command sha256sum

    if [ -z "$download_link" ]; then
        >&2 echo "No download link provided. Fetching from official website..."
        download_link=$(get_download_link_from_official)
    fi

    >&2 echo "Download link: $download_link"
    official_last_modified=$(get_last_modified || true)
    >&2 echo "Last-Modified: ${official_last_modified:-unknown}"

    login_gh
    download_wechat

    now_sum256=$(sha256sum "$installer_path" | awk '{print $1}')
    >&2 echo "SHA256: $now_sum256"

    local latest_sum256
    latest_sum256=$(latest_release_sha)
    if [ -n "$latest_sum256" ] && [ "$now_sum256" = "$latest_sum256" ]; then
        >&2 echo -e "\n\033[1;32mThis is the newest version by SHA256.\033[0m\n"
        clean_data
        exit 0
    fi

    extract_version

    local version_sum256
    version_sum256=$(release_sha_for_version)
    if [ -n "$version_sum256" ] && [ "$now_sum256" = "$version_sum256" ]; then
        >&2 echo -e "\n\033[1;32mv${dest_version} already exists with the same SHA256.\033[0m\n"
        clean_data
        exit 0
    fi

    prepare_release
    publish_release
    clean_data
}

main
