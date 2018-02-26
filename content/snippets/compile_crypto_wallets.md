+++
title = "Compile Cryptocurrency Wallets"
description = "Compile Cryptocurrency Wallets in Ubuntu 16.04"
date = "2018-02-26T00:16:00-04:00"
categories = ["compile"]
tags = ["crypto"]
hide = true
+++

# Environment Setup

```
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libboost-all-dev libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqt4-dev libprotobuf-dev protobuf-compiler libqrencode-dev libleveldb-dev
```

BerkeleyDB 4.8 (5.1 is latest in ppa)

```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev
```

# Installing Boost

So.. painful... but must compile.

And also needs to install multiple versions and create symbolic link.

```
wget https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2
tar --bzip2 -xf /path/to/boost_1_66_0.tar.bz2
cd boost_1_66_0
./bootstrap.sh --prefix=/usr/local
./b2 install
```

For Cmake projects, set this environment variable

```
export BOOST_ROOT=/usr/local/lib
```

Or pass flags directly 

```
cmake -DCMAKE_INSTALL_PREFIX=$TARGET \
    -DBoost_NO_BOOST_CMAKE=TRUE \
    -DBoost_NO_SYSTEM_PATHS=TRUE \
    -DBOOST_ROOT:PATHNAME=$TARGET \
    -DBoost_LIBRARY_DIRS:FILEPATH=${TARGET}/lib
```

# Kreds Wallet

```
git clone https://github.com/KredsBlockchain/kreds-core/
cd kreds-core
git checkout v1.0.0.1
./autogen.sh
./configure --with-boost-libdir=/usr/local/lib
make
```

# Graft Wallet

pretty pain-free

```
sudo apt-get install build-essential cmake pkg-config libssl-dev libunbound-dev libminiupnpc-dev
```

```
git clone https://github.com/graft-project/GraftNetwork
cd GraftNetwork
git checkout v1.0.1
make
# check build/release/bin
# graftnoded --detach
```

# Bitspace Wallet

```
git clone https://github.com/Bitspacedev/BitSpace
cd BitSpace
qmake
make
```

# Pulsar Wallet

