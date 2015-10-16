cd /var/www/nest/dropcam/archives
tar czf zips/$(date +%y%m%d_%H).tgz *.jpg --remove-files

