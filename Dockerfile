FROM ubuntu:xenial

RUN apt-get update && apt-get install -yq build-essential libssl-dev libdb++-dev libminiupnpc-dev libboost-all-dev libqrencode-dev

WORKDIR /data
ADD src /data/src
ADD share /data/share

WORKDIR /data/src
RUN make -f makefile.unix clean
RUN make -f makefile.unix
RUN cp bellsd /usr/local/bin

WORKDIR /root/.bells
RUN echo "rpcuser=bellsrpc" > bells.conf
RUN echo "rpcpassword=$(echo $RANDOM | md5sum | head -c 20)" >> bells.conf

ADD docker-entrypoint.sh /usr/local/bin
RUN chmod ugo+x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
