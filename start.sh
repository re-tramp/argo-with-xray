#!/bin/sh


trap 'rm -rf "$DIR_TEMP"' EXIT
DIR_TEMP=$(mktemp -d)
FILE_APP=$DIR_TEMP/app.zip

curl -Lo $FILE_APP $download_link || exit 1

unzip $FILE_APP -d $DIR_TEMP

cp $(find $DIR_TEMP -name "xray") ./

sed -i "s/UUID/$UUID/g" ./xray.json || exit 1


echo "your password is ${UUID}"

./xray -config ./xray.json &

cloudflared tunnel --no-autoupdate run --token ${TOKEN}        







