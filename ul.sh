#!/bin/bash
str=$(
	for f in $(find . -maxdepth 1 -type f -iname "*.pkg.tar.zst"); do
		echo "-F f[]=@${f}"
	done
)
curl -i $str https://oshi.at
