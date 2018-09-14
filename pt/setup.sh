#!/bin/sh

if [ ! `which pt` ]; then
  echo "Download pt ..."
  sudo wget -O /usr/local/bin/pt $BASE_URL/pt/pt
  sudo chmod +x /usr/local/bin/pt
fi

