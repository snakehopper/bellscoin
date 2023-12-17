## Preq

Install docker

## Build

```
docker build -t bellscoin . 
```

## Create Wallet

```
docker run -v $(pwd)/app:/root/.bells bellscoin bellsd getnewaddress
```

## List All Wallet Address

```
docker run -v $(pwd)/app:/root/.bells bellscoin bellsd listreceivedbyaddress 0 true
```

## Get Executable File bellsd

```
docker run -v $(pwd)/app:/root/.bells bellscoin cp /usr/local/bin/bellsd /root/.bells
ls app/bellsd
```


## Validate wallet.dat

As run docker with `-v $(pwd)/app` above, the `wallet.dat` will be in `app` directory.

Remember move it to a secure place.

```
$ ls ./app
bells.conf    bellsd.pid    blk0001.dat   blkindex.dat  database/     db.log        debug.log     peers.dat     wallet.dat
```
