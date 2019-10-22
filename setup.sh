#!/usr/bin/env bash

rm tmp/durations.txt
rm tmp/secondsEach.txt
rm tmp/secondsTotal.txt

bash refresh.sh
bash calculateTotal.sh
bash calculateEach.sh
