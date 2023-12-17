#!/bin/bash
set -e


CONF=/root/.bells/bells.conf
if [ ! -f "$CONF" ]; then
	mkdir -p /root/.bells
	echo "rpcuser=bellsrpc" > $CONF
	echo "rpcpassword=$(echo $RANDOM | md5sum | head -c 20)" >> $CONF
fi

bellsd -gen=0 -daemon -rpcallowip=0.0.0.0
while [[ ! $(bellsd getinfo) ]]; do
	sleep 1
done

exec "$@"

