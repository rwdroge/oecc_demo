#!/bin/bash
logfile=/home/oecc_server/nohup.out
touch $logfile
cd /home/oecc_server
./oeccserver start -b 0.0.0.0
tail -f $logfile