#!/usr/bin/env bash

calculation="$(cat tmp/durations.txt | sed 's/:.*$/+/' | tr '\n' ' ')0"
minPart=$(echo "$calculation" | bc)

calculation="0$(cat tmp/durations.txt | sed 's/^.*:/+/' | tr '\n' ' ')"
secPart=$(echo "$calculation" | bc)

sec=$(echo "$minPart * 60 + $secPart" | bc)

mkdir -p tmp
rm -f tmp/secondsTotal.txt
echo "$sec" >>tmp/secondsTotal.txt
