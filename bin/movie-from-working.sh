#!/bin/bash
topdir=/tmp/dropworking
c=01
#while [ (ls -1 $topdir|wc -l) -gt 1 ]

WORKING_DIR=/tmp/dropworking
FIRST_FILE=$(ls -1 $WORKING_DIR |head -n 1)
LAST_FILE=$(ls -r1 $WORKING_DIR |head -n 1)
OUTPUTFILE=$FIRST_FILE-$LAST_FILE.gif
files="$(find $WORKING_DIR -type f -exec echo {} \; |sort | tr '\n' ' ')"

cd /var/www/nest/dropcam/movies

convert -limit thread 4 -delay 1x2 -loop 0 $files $OUTPUTFILE && echo "Your animation ($OUTPUTFILE) has been created."
