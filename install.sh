#!/usr/bin/env bash

username="$(cat username.txt)" # your github user name
url="https://raw.githubusercontent.com/$username/lazyRadio/master"
echo "alias lazyRadio='curl -s $url/play.sh | bash -s -- $url'" >>~/.bashrc
