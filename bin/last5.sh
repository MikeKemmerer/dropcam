#!/bin/bash

cd /var/www/nest/dropcam/archives
date_dir=$(date +%y%m%d_%H)
date_mov=$(date +%y%m%d_%H%M)
files="$(find /var/www/nest/dropcam/working -cmin -5 -type f -exec echo {} \; |sort | tr '\n' ' ')"

cd /var/www/nest/dropcam/movies

convert -limit thread 4 -delay 1x2 -loop 0 $files ${date_mov}_last5.gif && echo "Your animation (${date_mov}_last5.gif) has been created."
