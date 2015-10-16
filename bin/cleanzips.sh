#!/bin/bash

cd /var/www/nest/dropcam/archives/zips

for i in $(ls -1Sr)
  do
  if [ $(tar -tvf $i | wc -l) -eq 0 ]
    then
    echo "remove empty archive $i"
    rm -f $i
  fi
done
