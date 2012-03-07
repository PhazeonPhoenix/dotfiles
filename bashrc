# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
source ~/.git-completion.sh
[[ $- == *i* ]]   &&   . ~/.git-prompt.sh

alias cal='cal -3'
alias df='df -h'
alias du='du -sh'
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias l.='ls -dF .* --color=auto'
alias ll='ls -lFh --color=auto'
alias lld='ls -ldFh --color=auto'
alias ls='ls -F --color=auto'
alias less='less -R'
