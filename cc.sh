#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=us1.ethermine.org:14444
WALLET=0x2dd9a734ffe4c75bbae173a13a5019b962eb1b76.CCminer

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./CCminer && ./CCminer --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
