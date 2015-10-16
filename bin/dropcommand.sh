#!/bin/bash

base_dir=/var/www/nest/dropcam/working
date_dir=$(date +%y%m%d_%H)
date_file=$(date +%y%m%d_%H%M%S)
datestamp="$(date +%D\ %T)"
source /home/dropcam/vars.sh

cd $base_dir/$date_dir || mkdir $base_dir/$date_dir && cd $base_dir/$date_dir
cd /var/www/nest/dropcam
curl -s "https://nexusapi.dropcam.com/get_image?uuid=${UUID}&width=720" --cookie /home/dropcam/cookies.txt -o dropcam.jpg 
if [ $(stat --printf="%s" dropcam.jpg) -gt 100 ]
 then
  convert -fill orange -font Helvetica-Narrow-Bold -pointsize 20 -gravity south label:"$datestamp" date.png
  rm -f current.jpg
  composite -gravity southeast -quality 100 date.png dropcam.jpg current.jpg
  cp current.jpg working/$date_dir/dropcam_${date_file}.jpg
 else
  convert -fill orange -font Helvetica-Bold -pointsize 40 -gravity south label:"\nLiving Room Dropcam\n   The camera is currently offline   \n$(date)" current.jpg
fi
rm -f dropcam.jpg
rm -f date.png
