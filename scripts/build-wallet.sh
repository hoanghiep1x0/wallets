#!/bin/bash 


  read -p "Enter git source: " project
  git clone $project


  echo "sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils"

  echo "sudo apt-get install -y libboost-all-dev"

  echo "sudo apt-get install -y software-properties-common"
  echo "sudo add-apt-repository ppa:bitcoin/bitcoin"
  echo "sudo apt-get update"
  echo "sudo apt-get install -y libdb4.8-dev libdb4.8++-dev"

  echo "sudo apt-get install -y libminiupnpc-dev"
  echo "sudo apt-get install -y libzmq3-dev"

  echo "sudo apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler"
  echo "sudo apt-get install -y libqrencode-dev"
  
  ls 

  read -p "Cd forder: " forder


  cd $forder

  ./autogen.sh

  CONFIG_SITE=$PWD/depends/x86_64-pc-linux-gnu/share/config.site ./configure --prefix=/  --without-gui

  make install

  cd ./src

  ls 

  read -p "file daremon coppy to foder /root/wallets/...coin forder" coind
  strip $coind


while true; do
 if [ -d ~/wallets ]; then
   mkdir ~/wallets/$forder
   chmod 777 -R ~/wallets/$forder
   break
 else
    mkdir wallets/
    chmod 777 -R ~/wallets
   break
 fi
done

cp $coind ~/wallets/$forder/$coind

echo "file cli coppy to foder /root/wallets/...coin forder " 
read coic
strip $coic

cp $coic ~/wallets/$forder/$coic

cd ~/wallets/$forder

apt-get install zip  
zip -r $forder.zip ~/wallets/$forder

chmod 777 -R ~/wallets/$forder/$forder.zip

