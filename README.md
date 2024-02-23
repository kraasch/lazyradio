
# the lazyradio 

it is a lazy radio station using github and some shell.

## idea

allows you publish your own radio playlist on github.

you can listen to the same songs with friends as long as you are tuned into the
same channels.

faq section:

 - **is it secure?** not really, because it just curls what ever you have posted on
github and therefore could be used to spread malicious code.

 - **am i ruthless enough to publish it anyway?** yes.

 - **will it ever get popular?** no.

that said, use at your own risk!

### config and installation

 - fork repo -- this creates your own place on the web where you can upload your web radio playlist.
 - clone to local machine -- mainly for further editing.
 - adopt url in `install.sh` to your fork's url, to match the raw files `play.sh`, `txt/secondsEach.txt` and `txt/secondsTotal.txt` -- when using github as your remote git server only `username.txt` has to be changed.
 - adopt urls in `songs.txt` to your liking -- just add in your own urls, one per line, even non youtube urls should work, but I didn't test this.
 - run `bash setup.sh` in terminal on local machine (from within your local git repo's root) -- this adopts the files in the `tmp` directory to your new playlist (this has to be done every time the playlist changes).
 - add, commit and push changes -- this makes your changes publically accessible through the web.
 - run `bash install.sh` in terminal on local machine (from within your local git repo's root) -- this should add an alias to your `.bashrc` (`source ~/.bashrc` to use the alias, or open another terminal).

### installation only

 - fork repo .
 - clone to local machine.
 - run `bash install.sh` in terminal on local machine (from within git repo's root).

### usage

 - run `lazyRadio` alias in terminal on local machine to play radio -- this alias grabs your public script from the your public git repo and downloads and plays the urls in your playlist.

### main dependencies

 - youtube-dl.
 - mpv.
 - curl, git, github, etc.

### notes

 - will play songs almost simultaneously on different machines, as long as those have their UTC system time configured similar.
 - breaks for people that cannot access certain urls provided through `songs.txt` from their country.
 - should work with not only youtube urls since youtube-dl and mpv can do more than only youtube.
 - when playing long songs (as provided through urls) the different radios might differ because of different loading issues per machine (this offset should reset with every newly started song).

### meta

 - https://stackoverflow.com/questions/24547655/get-utc-time-in-seconds
 - https://stackoverflow.com/questions/5688576/how-to-use-mod-operator-in-bash
 - https://stackoverflow.com/questions/6022384/bash-tool-to-get-nth-line-from-a-file
 - https://unix.stackexchange.com/questions/306007/how-to-pass-argument-to-script-which-is-input-to-bash
