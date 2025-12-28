#!/usr/bin/env bash

set -eo pipefail

temp_path="WeChatSetup/temp"
latest_path="WeChatSetup/latest"

function get_download_link_from_official() {
    >&2 printf "#%.0s" {1..60}
    >&2 echo 
    >&2 echo -e "## \033[1;33mFetching download link from https://pc.weixin.qq.com/\033[0m"
    >&2 printf "#%.0s" {1..60}
    >&2 echo 
    
    # 从官网获取64位版本的下载链接
    local page_content=$(curl -s -L "https://pc.weixin.qq.com/")
    if [ $? -ne 0 ]; then
        >&2 echo -e "\033[1;31mFailed to fetch page from official website!\033[0m"
        return 1
    fi
    
    # 提取 id="downloadButton" 的 href 属性值（64位版本）
    # 使用 sed -E 提取，兼容 macOS 和 Linux
    local link=$(echo "$page_content" | grep 'id="downloadButton"' | sed -E 's/.*id="downloadButton"[^>]*href="([^"]*)".*/\1/' | head -1)
    
    if [ -z "$link" ]; then
        # 备用方案：从文件名构建完整链接
        local filename=$(echo "$page_content" | grep -o 'WeChatWin_[^"]*\.exe' | head -1)
        if [ -n "$filename" ]; then
            link="https://dldir1v6.qq.com/weixin/Universal/Windows/$filename"
        fi
    fi
    
    if [ -z "$link" ]; then
        >&2 echo -e "\033[1;31mCould not extract download link from official website!\033[0m"
        return 1
    fi
    
    # 只输出 URL 到 stdout，其他信息都输出到 stderr
    echo "$link"
}

# 获取下载链接
download_link="$1"
if [ -z "$1" ]; then
    >&2 echo -e "No download link provided. Fetching from official website..."
    download_link=$(get_download_link_from_official)
    if [ -z "$download_link" ]; then
        >&2 echo -e "\033[1;31mFailed to get download link from official website!\033[0m"
        exit 1
    fi
    >&2 echo -e "Download link: $download_link"
fi

function install_depends() {
    printf "#%.0s" {1..60}
    echo 
    echo -e "## \033[1;33mInstalling 7zip, shasum, wget, curl, git\033[0m"
    printf "#%.0s" {1..60}
    echo 

    apt install -y p7zip-full p7zip-rar libdigest-sha-perl wget curl git
}

function login_gh() {
    printf "#%.0s" {1..60}
    echo 
    echo -e "## \033[1;33mLogin to github to use github-cli...\033[0m"
    printf "#%.0s" {1..60}
    echo 
    if [ -z "$GHTOKEN" ]; then
        >&2 echo -e "\033[1;31mMissing Github Token! Please get a GHToken from 'Github Settings->Developer settings->Personal access tokens' and set it in Repo Secrect\033[0m"
        exit 1
    fi

    echo $GHTOKEN > WeChatSetup/temp/GHTOKEN
    gh auth login --with-token < WeChatSetup/temp/GHTOKEN
    if [ "$?" -ne 0 ]; then
        >&2 echo -e "\033[1;31mLogin Failed, please check your network or token!\033[0m"
        clean_data 1
    fi
    rm -rfv WeChatSetup/temp/GHTOKEN
}

function download_wechat() {
    printf "#%.0s" {1..60}
    echo 
    echo -e "## \033[1;33mDownloading the newest WechatSetup...\033[0m"
    printf "#%.0s" {1..60}
    echo 

    wget "$download_link" -O ${temp_path}/WeChatSetup.exe
    if [ "$?" -ne 0 ]; then
        >&2 echo -e "\033[1;31mDownload Failed, please check your network!\033[0m"
        clean_data 1
    fi
}

function extract_version() {
    printf "#%.0s" {1..60}
    echo 
    echo -e "## \033[1;33mExtract WechatSetup, get the dest version of wechat\033[0m"
    printf "#%.0s" {1..60}
    echo 
    
    # 解压安装包
    7z x ${temp_path}/WeChatSetup.exe -o${temp_path}/temp
    
    # 方法1: 尝试从文件夹名中提取版本号（新版本格式：[x.x.x.x]）
    dest_version=$(find ${temp_path}/temp -maxdepth 1 -type d -name '\[*\]' | sed -e 's/.*\[\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)\].*/\1/' | head -1)
    
    # 方法2: 如果方法1失败，检查是否有 install.7z 文件，需要进一步解压
    local temp2_created=false
    if [ -z "$dest_version" ] && [ -f "${temp_path}/temp/install.7z" ]; then
        >&2 echo -e "\033[1;33mMethod 1 failed, trying method 2: extract install.7z...\033[0m"
        mkdir -p ${temp_path}/temp2
        temp2_created=true
        7z x ${temp_path}/temp/install.7z -o${temp_path}/temp2
        # 从解压后的文件中查找版本号文件夹
        dest_version=$(find ${temp_path}/temp2 -maxdepth 1 -type d -name '\[*\]' | sed -e 's/.*\[\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)\].*/\1/' | head -1)
    fi
    
    # 方法3: 如果方法2也失败，尝试从 improve.xml 中提取（旧版本方法）
    if [ -z "$dest_version" ]; then
        >&2 echo -e "\033[1;33mMethod 2 failed, trying method 3: extract from improve.xml...\033[0m"
        local outfile=$(7z l ${temp_path}/WeChatSetup.exe | grep improve.xml | awk 'NR ==1 { print $NF }')
        if [ -n "$outfile" ]; then
            7z x ${temp_path}/WeChatSetup.exe -o${temp_path}/temp "$outfile" 2>/dev/null || true
            if [ -f "${temp_path}/temp/$outfile" ]; then
                dest_version=$(awk '/MinVersion/{ print $2 }' "${temp_path}/temp/$outfile" | sed -e 's/^.*="//g' -e 's/".*$//g' | head -1)
            fi
        fi
        # 如果在 install.7z 解压后的目录中查找 improve.xml
        if [ -z "$dest_version" ] && [ "$temp2_created" = true ] && [ -d "${temp_path}/temp2" ]; then
            outfile=$(find ${temp_path}/temp2 -name "improve.xml" | head -1)
            if [ -n "$outfile" ] && [ -f "$outfile" ]; then
                dest_version=$(awk '/MinVersion/{ print $2 }' "$outfile" | sed -e 's/^.*="//g' -e 's/".*$//g' | head -1)
            fi
        fi
    fi
    
    # 清理临时目录
    if [ "$temp2_created" = true ] && [ -d "${temp_path}/temp2" ]; then
        rm -rf ${temp_path}/temp2
    fi
    
    # 如果还是失败，报错
    if [ -z "$dest_version" ]; then
        >&2 echo -e "\033[1;31mFailed to extract version number!\033[0m"
        >&2 echo -e "\033[1;33mDebug: Listing extracted files:\033[0m"
        >&2 ls -la ${temp_path}/temp/ || true
        if [ -d "${temp_path}/temp2" ]; then
            >&2 echo -e "\033[1;33mDebug: Listing temp2 files:\033[0m"
            >&2 ls -la ${temp_path}/temp2/ || true
            rm -rf ${temp_path}/temp2
        fi
        exit 1
    fi
    
    >&2 echo -e "\033[1;32mExtracted version: $dest_version\033[0m"
}


# rename and replace
function prepare_commit() {
    printf "#%.0s" {1..60}
    echo 
    echo -e "## \033[1;33mPrepare to commit new version\033[0m"
    printf "#%.0s" {1..60}
    echo 

    mkdir -p WeChatSetup/$dest_version
    cp $temp_path/WeChatSetup.exe WeChatSetup/$dest_version/WeChatSetup-$dest_version.exe
    echo "DestVersion: $dest_version" > WeChatSetup/$dest_version/WeChatSetup-$dest_version.exe.sha256
    echo "Sha256: $now_sum256" >> WeChatSetup/$dest_version/WeChatSetup-$dest_version.exe.sha256
    echo "UpdateTime: $(date -u '+%Y-%m-%d %H:%M:%S') (UTC)" >> WeChatSetup/$dest_version/WeChatSetup-$dest_version.exe.sha256
    echo "DownloadFrom: $download_link" >> WeChatSetup/$dest_version/WeChatSetup-$dest_version.exe.sha256
    
}

function clean_data() {
    printf "#%.0s" {1..60}
    echo 
    echo -e "## \033[1;33mClean runtime and exit...\033[0m"
    printf "#%.0s" {1..60}
    echo 

    rm -rfv WeChatSetup/*
    exit $1
}

function main() {
    # rm -rfv WeChatSetup/*
    mkdir -p ${temp_path}/temp
    login_gh
    ## https://github.com/actions/virtual-environments/blob/main/images/linux/Ubuntu2004-Readme.md
    # install_depends
    download_wechat

    now_sum256=`shasum -a 256 ${temp_path}/WeChatSetup.exe | awk '{print $1}'`
    local latest_sum256=`gh release view  --json body --jq ".body" | awk '/Sha256/{ print $2 }'`

    if [ "$now_sum256" = "$latest_sum256" ]; then
        >&2 echo -e "\n\033[1;32mThis is the newest Version!\033[0m\n"
        clean_data 0
    fi
    ## if not the newest
    extract_version
    prepare_commit

    gh release create v$dest_version ./WeChatSetup/$dest_version/WeChatSetup-$dest_version.exe -F ./WeChatSetup/$dest_version/WeChatSetup-$dest_version.exe.sha256 -t "Wechat v$dest_version"

    gh auth logout --hostname github.com | echo "y"

    clean_data 0
}

main

