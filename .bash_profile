export CC=gcc-4.2
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
#uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

source ~/.alias
source ~/Scripts/git-completion.bash

export CLICOLOR=yes
export GIT_MERGE_AUTOEDIT=no

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set the PS1 variable
PS1="\[\e[1;34m\]\w\[\e[0;35m\]\$(parse_git_branch)\[\e[0;0m\]$ "

# export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin'
# PATH=$HOME/.rvm/bin:$PATH
# PATH="/usr/local/heroku/bin:$PATH"
# [[ -s "/Users/yon/.rvm/scripts/rvm" ]] && source "/Users/yon/.rvm/scripts/rvm"  # This loads RVM into a shell session.
# export GIT_MERGE_AUTOEDIT=no
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME\/Development/~DEV}\007"'
# export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
# export PATH=~/Development/sdk/pebble-dev/arm-cs-tools/bin:$PATH
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
