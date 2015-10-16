#!/bin/bash
source /home/dropcam/vars.sh
ssh -t $processor '/var/www/nest/dropcam/bin/last15.sh'
