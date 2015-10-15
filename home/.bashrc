#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon -ixoff
clear

# @archlinux
alias cws='cower -sc --sort=votes'
alias cwd='cd $HOME/cwr/ && cower -d'
alias cwu='cd $HOME/cwr/update && cower -du'
alias pcs='pacman -Ss'
alias pcd='sudo pacman -S'
alias pcc='sudo pacman -Sy'
alias pcu='sudo pacman -Syu'
alias pcr='sudo pacman -Rs'

# @all
alias rm='rm -vrI'
alias ls='ls -l --color=auto'
alias start='startx -- -keeptty > ~/.xorg.log 2>&1'

alias wifi-menu='sudo wifi-menu'
alias netctl='sudo netctl'

alias ..='cd ..'
alias rsn='rsync -rnvuh --progress'
alias rsc='rsync -rvuh --progress'
alias mn='udisks --mount'
alias umn='udisks --unmount'
alias mocp='mocp -T mono'

alias ukill='killall -u $USER'
alias fehbg='feh --bg-fill'

if [ $(id -u) -eq 0 ]; then
  PS1='\[\e[1;31m\]\h \[\e[1;34m\]\W$(__git_ps1) \$\[\e[0m\] '
else
  PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\W$(__git_ps1) \$\[\e[0m\] '
fi

source /usr/share/git/completion/git-prompt.sh
set bell-style visible

export PATH=$PATH:$HOME/bin
export SUDO_EDITOR=rvim
export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTSIZE=
export BROWSER=/usr/bin/chromium

eval "$(dircolors ~/.dirname)"
eval "$(dircolors ~/.dircolors)"

#feh_browser
function fo()
{
  feh_browser $1 -B black -g 1280x720 -q;
}

# livestreamer
function lv()
{
  livestreamer -p mpv twitch.tv/$1 source;
}

# compite c files
function bcc()
{
  if [ -f $1 ]; then
    case $1 in
      *.c       ) gcc -O -Wall -W -pedantic -ansi $1 -o ${1%.c} && ./${1%.c};;
      *)        echo "'$1' is not a c file.";;
      esac
    else
      echo "'$1' is not a valid file!"
  fi
}

# extract files
function extract () {
  if [ -f $1 ]; then
    case $1 in
      *.zip     ) unzip $1    ;;
      *.tar.gz  ) tar -xvf $1 ;;
      *.rar     ) unrar x $1    ;;
      *)        echo "'$1' cannot be extracted via extract!" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# generate a random password
genpass () {
  tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c ${1:-30};
  echo
}
