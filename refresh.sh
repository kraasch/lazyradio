#!/usr/bin/env bash

mkdir -p tmp
rm -f tmp/durations.txt

while read x; do
	echo "youtube-dl $x --get-duration >> tmp/durations.txt"
	youtube-dl "$x" --get-duration >>tmp/durations.txt
done <songs.txt
