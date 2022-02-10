#!/bin/bash

CHATID=-1001237208416

for f in $(find . -maxdepth 1 -type f -iname "*.pkg.tar.zst"); do
    url=$(curl -F f[]=@"${f}" https://oshi.at | grep "DL:" | cut -d ' ' -f2)
    URLS+=("$url")
done

curl -sX POST https://api.telegram.org/bot"${TOKEN}"/sendMessage \
    -d chat_id="${CHATID}" \
    -d parse_mode=HTML \
    -d disable_web_page_preview=true \
    -d text="
<b>linux-dragonheart CI Build Completed</b>

Kernel:  ${URLS[1]}
Headers: ${URLS[0]}

Install with <code>pacman -U linux-dragonheart-*</code>"
