#!/bin/env bash
# path должен быть до папки uploads
# Пример
# jpegoptitodata.sh .../public_html/wp-content/uploads

path=$1
year=$(date +"%Y")
mouth=$(date +"%m")
last_year=$(date +"%Y" | awk -F '/' '{$NF--}1' OFS='/')
last_mouth=$(date -d " - $(date +%d) days" +%m)

if [ $last_mouth = "12" ] && [ $mouth = "01" ]
then
    find $path/$last_year/$last_mouth -type f -regextype posix-egrep -regex '.*(jpg|jpeg)$' -exec jpegoptim --strip-all --max=30 {} \;
else
    find $path/$year/$last_mouth -type f -regextype posix-egrep -regex '.*(jpg|jpeg)$' -exec jpegoptim --strip-all --max=30 {} \;
fi


