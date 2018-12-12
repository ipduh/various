g0 srv vimrc
------

```
[ "$EUID" -ne "0" ] &&  wget https://raw.githubusercontent.com/ipduh/vimrc/master/vimrc -O ~/.vimrc  || wget https://raw.githubusercontent.com/ipduh/various/master/vimrc/vimrc -O /etc/vim/vimrc.local

```
