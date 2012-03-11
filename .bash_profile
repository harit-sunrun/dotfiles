#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------


if [ -f /etc/bashrc ]; then
        . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

#------------------------------------------------------------
# Some Colors
#------------------------------------------------------------
# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'              # No Color

#-------------------------------------------------------------
# Shell Prompt
#-------------------------------------------------------------


if [[ "${DISPLAY%%:0*}" != "" ]]; then  
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi

#-------------------
# Personnal Aliases
#-------------------

alias rm='rm -i'
alias cp='cp -rf'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'
alias lt='ls -ltr'
alias pas='cat ~/.passwd'

#-------------------------------------------------------------
# File & string-related functions:
#-------------------------------------------------------------
# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

function extract()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------


function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,command ; }
function pp() { my_ps -f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

#-------------------------------------------------------------
# Prompt
#-------------------------------------------------------------
export PS1="\u@\h\w - \t$ "

#-------------------------------------------------------------
# Paths
#-------------------------------------------------------------
export PYTHONPATH=~/code/sr/python/work/dw/analytics

# MongoDB path
if [ -d /usr/local/mongodb/bin ]; then
  PATH=$PATH:/usr/local/mongodb/bin
fi

# Hadoop path
if [ -d /usr/local/hadoop/bin ]; then
  PATH=$PATH:/usr/local/hadoop/bin
fi
export PATH
