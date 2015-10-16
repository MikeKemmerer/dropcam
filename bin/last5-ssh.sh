#!/bin/bash
source /home/dropcam/vars.sh
ssh -t $processor '/var/www/nest/dropcam/bin/last5.sh'
