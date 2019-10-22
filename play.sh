#!/usr/bin/env bash

function playSongAt() {
	url="$1"
	sec="$2"
	mpv "$url" --start=+"$sec" --vid=no
}

function determinSongAndPlay() {
	utc=$(date +%s)
	sec=$(cat /tmp/secondsTotal.txt)
	current=$((utc % sec))

	line=0
	add=0
	addOld=-1

	while read x; do
		line=$((line + 1))
		addOld=$add
		add=$((add + x))

		if $(test $add -gt $current); then
			break
		fi
	done </tmp/secondsEach.txt

	secWithinSong=$((current - addOld))
	songUrl=$(cat /tmp/songs.txt | sed "$line q;d")

	# TODO: make sure to request start seconds from mpv within 0 and nowLength, eg start=min(max(0, start), nl).
	#nowLength=$(cat /tmp/secondsEach.txt | sed "$line q;d")

	playSongAt "$songUrl" "$secWithinSong"
}

function bufferRemoteLists() {
	url="$@"
	curl -s "$url/songs.txt" >/tmp/songs.txt
	curl -s "$url/tmp/secondsTotal.txt" >/tmp/secondsTotal.txt
	curl -s "$url/tmp/secondsEach.txt" >/tmp/secondsEach.txt
}

function loop() {
	while true; do
		echo start
		echo 'Interrupt with Ctrl-c Ctrl-c.'
		determinSongAndPlay
		echo stop
		# sleep to give user chance to interrupt loop after cancelling mpv (eg by pressing ctrl-c twice).
		sleep 1
		echo loop
	done
}

url="$@"
bufferRemoteLists "$url"
loop
