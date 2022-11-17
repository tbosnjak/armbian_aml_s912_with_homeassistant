#!/bin/bash

[ -d ~/.ddns ] || mkdir ~/.ddns

[ -f ~/.ddns/state ] && source ~/.ddns/state

[ ! -f ~/.ddns/config ] && echo "File '~/.ddns/config' not found! Exiting!" && exit -1

source ~/.ddns/config

CURRENT_IPV4=$(curl curl -s4 https://ifconfig.co)
CURRENT_IPV6=$(curl curl -s6 https://ifconfig.co)

UPDATE_DNS=0

[ -z $OLD_IPV4 ] && OLD_IPV4=$CURRENT_IPV4 && UPDATE_DNS=1
[ -z $OLD_IPV6 ] && OLD_IPV6=$CURRENT_IPV6 && UPDATE_DNS=1

if [[ $OLD_IPV4 != $CURRENT_IPV4 || $OLD_IPV6 != $CURRENT_IPV6 ]]; then
    OLD_IPV4=$CURRENT_IPV4
    OLD_IPV6=$CURRENT_IPV6
    UPDATE_DNS=1
fi

if [ $UPDATE_DNS == 1 ]; then
    echo "$(date +"%Y/%m/%d %H:%M:%S"): Updating DDNS!" >>~/.ddns/log
    echo "" >>~/.ddns/log
    curl -sL "https://www.ddnss.de/upd.php?key=${UPDATE_KEY}&host=cb.dyn.home-webserver.de&ip=${CURRENT_IPV4}&ip6=${CURRENT_IPV6}" >>~/.ddns/log
    echo "" >>~/.ddns/log
    echo -e "\t New IPV4: $CURRENT_IPV4" >>~/.ddns/log
    echo -e "\t New IPV6: $CURRENT_IPV6" >>~/.ddns/log
    echo "" >>~/.ddns/log
    cat >>~/.ddns/state <<EOT
OLD_IPV4=$CURRENT_IPV4
OLD_IPV6=$CURRENT_IPV6
EOT
else
    echo "$(date +"%Y/%m/%d %H:%M:%S"): No update" >>~/.ddns/log
fi
