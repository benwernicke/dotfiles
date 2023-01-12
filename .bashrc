#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|

export PATH="~/Scripts:"$PATH


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias lll='ls -la --color=never | less'
alias ls='exa -l --color=always'
alias ll='exa -la --color=always'
alias grep='grep --color=always'
alias clip='xclip -sel c'
alias paste='xclip -o'
alias pm='pulsemixer'

alias bb="./beaver"

alias fixme='grep TODO --line-number -H -R'

alias ss='shutdown 0'
alias sr='reboot'

# Because I am stupid
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias font='setfont iso01-12x22'
alias sx='startx'
alias make='make -j4'

set -o vi

# Valgrind needs this since latest update
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"


todo
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo ":${BRANCH}${STAT}"
    else
        echo ""
    fi
}

export PS1="\[\e[31m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\]\[\e[37m\] \[\e[m\]\[\e[36m\]\W\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[31m\]]\[\e[m\]\\$\[\e[37m\] \[\e[m\]"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

