#!/usr/bin/env bash

mkdir -p tmp
rm -f tmp/secondsEach.txt

while read x; do

	sec=$(echo "$x" | sed 's/:/ * 60 + /' | bc)
	echo "$sec" >>tmp/secondsEach.txt

done <tmp/durations.txt
