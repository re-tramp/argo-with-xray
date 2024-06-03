#!/bin/sh


trap 'rm -rf "$dir_temp"' EXIT
dir_temp=$(mktemp -d)
file_app=$temp_dir/app.zip

curl -Lo $file_app $download_link || exit 1

unzip $file_app -d $dir_temp

cp $(find $dir_temp -name "xray") ./

sed -i "s/UUID/$gen_uuid/g" ./xray.json || exit 1


echo "your password is ${gen_uuid}"

./xray -config ./xray.json &
