alias fucking='sudo '
alias domd5sum='md5sum * | tee checksum.md5'
alias domd5sumr='find -type f -exec md5sum '{}' \; | tee checksum.md5'
alias checkmd5sum='md5sum -c checksum.md5 '
alias rdesktop='rdesktop -g 1900x1000 -u "WIBSNET\ahofbauer"'

alias dockerexec='_dockerexec() { docker exec -ti $1 env TERM=xterm bash -l ;};_dockerexec'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

alias load-ssh-agent='eval $(ssh-agent -s) && ssh-add ~/.ssh/hofbauer_wibs_rsa'

alias youtube-dl-audio='youtube-dl --extract-audio --audio-format=vorbis '

alias dls='dropbox ls'
alias dbw='watch dropbox status'

alias sail='./vendor/bin/sail'

alias gt='gnome-terminal'
