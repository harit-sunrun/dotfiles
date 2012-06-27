#-------------------------------------------------------------
# knowing Operating System
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
       platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
       platform='darwin'
fi
#-------------------------------------------------------------

#-------------------------------------------------------------
# Java Path
#-------------------------------------------------------------
if [[ "$platform" == 'darwin' ]]; then
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/
fi

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
export PYTHONPATH=~/code/sr/python/work/dw/analytics:~/code/p/vlists/vlists
PYTHONPATH=$PYTHONPATH:$(pwd)/django-social-auth/:~/code/p/django-debug-toolbar/build/lib/debug_toolbar


# MongoDB path
if [ -d /usr/local/mongodb/bin ]; then
  PATH=$PATH:/usr/local/mongodb/bin
fi

# Hadoop path
if [ -d /usr/local/hadoop/bin ]; then
  PATH=$PATH:/usr/local/hadoop/bin
fi

# Nginx path
if [ -f /usr/local/sbin/nginx ]; then
  PATH=$PATH:/usr/local/sbin
fi

# MySQL path
if [ -d /usr/local/mysql/bin ]; then
  PATH=$PATH:/usr/local/mysql/bin
fi
export PATH

# EC2 paths
export EC2_HOME=~/.ec2
export AWS_RDS_HOME=~/.rds
export PATH=$PATH:$EC2_HOME/bin:$AWS_RDS_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`

#-------------------------------------------------------------
# GIT
#-------------------------------------------------------------

#showing git branches in bash prompt
function parse_git_branch {
          git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#-------------------------------------------------------------
# Prompt
#-------------------------------------------------------------
#export PS1="\u@\h\w - \t $ "
export PS1="\u@\h\w - \t \$(parse_git_branch) $ "


##
# Your previous /Users/hhimanshu/.bash_profile file was backed up as /Users/hhimanshu/.bash_profile.macports-saved_2012-05-23_at_10:58:00
##

# MacPorts Installer addition on 2012-05-23_at_10:58:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

