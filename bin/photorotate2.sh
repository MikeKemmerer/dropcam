#!/bin/bash
echo $(date)
current_datestamp=$(date +%y%m%d_%H)
archive_dir=$(date +%Y-%m)

cd /var/www/nest/dropcam/archives/zips/${archive_dir} || mkdir /var/www/nest/dropcam/archives/zips/${archive_dir}
cd /var/www/nest/dropcam/
#ls -1 working | grep -v "zips" | grep -v "${current_datestamp}"

#cd /tmp/$datestamp
for directory in $(ls -1 working| grep -v "zips" | grep -v "${current_datestamp}")
   do 
   filecount=$(ls -1 working/${directory} | wc -l)
   if [ $filecount -gt 1 ]
      then 
      echo -n "Processing $filecount files in directory \"$directory\""
      cd working
      XZ_OPT=-9 tar Jcf ../archives/zips/${archive_dir}/${directory}.tar.xz ./$directory --remove-files
   else
      echo -n "No files in directory \"$directory\""
   fi
   echo " ... removing $directory"
   rm -rf /var/www/nest/dropcam/working/$directory
done
