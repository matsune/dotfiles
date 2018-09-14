#!/bin/sh

if [ ! `which pt` ]; then
  sudo wget -O /usr/local/bin/pt --no-verbose $BASE_URL/pt/pt
fi

