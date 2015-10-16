#!/bin/bash

current_datestamp=$(date +%y%m%d_%H)

cd /var/www/nest/dropcam/archives/
#ls -1 | grep -v "zips" | grep -v "${current_datestamp}"

#cd /tmp/$datestamp
for directory in $(ls -1 | grep -v "zips" | grep -v "${current_datestamp}")
   do 
   filecount=$(ls -1 ${directory} | wc -l)
   if [ $filecount -gt 1 ]
      then 
      echo -n "Processing $filecount files in directory \"$directory\""
      tar czf zips/${directory}.tgz $directory --remove-files
   else
      echo -n "No files in directory \"$directory\""
   fi
   echo " ... removing $directory"
   rm -rf $directory
done
