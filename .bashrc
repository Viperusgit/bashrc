# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

###START OF EYKS TWEAKS###

##################
# GIT ALIASES    #
#Credit to Nathan#
##################

#Hub
alias git='hub'

#Add
alias ga='git add'
alias gaa='git add -A'

#Branch
alias gbd='git branch -D'
alias gb='git branch -v'

#Checkout
alias gch='git checkout'
alias gcb='git checkout -b'

#Cherry-pick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcpe='git cherry-pick --edit'
alias gcpnc='git cherry-pick --no-commit'
alias gcpq='git cherry-pick --quit'

#Commit
alias gc='git commit'
alias gca='git commit --amend'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gcs='git commit --signoff'
alias gcsm='git commit --signoff -m'

#Diff
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'

#Fetch
alias gf='git fetch'
alias gfa='git fetch aosp'

#Log
alias gl='git log'

#Merge
alias gmg='git merge'
alias gme='git merge -e'

#Push
alias gph='git push'
alias gpo='git push origin'
alias gpf='git push --force'
alias gpsu='git push --set-upstream origin'

#Rebase
alias grb='git rebase'

#Remote
alias grm='git remote'
alias gra='git remote add'
alias graa='git remote add aosp'
alias grr='git remote rm'

#Reset
alias grh='git reset --hard'

#Status
alias gs='git status'

###################
# Vanilla Aliases #
###################

#Main
alias envset='. build/envsetup.sh'
alias lva='lunch vanilla_angler-userdebug'
alias fuckjack='./prebuilts/sdk/tools/jack-admin kill-server'

#Make
alias mvanilla='mka vanilla'
alias mclean='mka clobber'
alias mSettings='lva && mka Settings'

#Full run
alias vanillafullrun='envset && lva && mvanilla'
alias vanillafullrunsync='repo sync --force-sync && envset && lva && mvanilla'
alias vanillafullrunsyncclean='repo sync --force-sync && envset && mclean && lva && mvanilla'

#Directory
alias cdv='cd ~/Vanilla'
alias cdb='cdv && cd build'
alias cdm='cdv && cd manifests'
alias cdfwb='cdv && cd frameworks/base'
alias cdfwc='cdv && cd frameworks/core'
alias cdfwn='cdv && cd frameworks/native'
alias cdpaS='cdv && cd packages/apps/Settings'
alias cdvv='cdv && cd vendor/vanilla'
alias cdvh='cdv && cd vendor/huawei'
alias cddha='cdv && cd device/huawei/angler'
alias cdsc='cdv && cd system/core'
alias cdss='cdv && cd system/sepolicy'
alias cdvcl='cdv && cd Vanilla_Changelog'

#Export
alias epixel='export PIXEL=true'
alias epublic='export PUBLIC=true'
alias estock='export PIXEL=false'
alias etest='export PUBLIC=false'

#################
# OTHER ALIASES #
#################

export PS1="\033[1;34m\h:\033[1;32m\W \033[1;34m\u\$ \e[m"

###########
# Exports #
###########

export ANDROID_JACK_VM_ARGS="-Xmx5g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
export USE_CCACHE=true

###END OF EYKS TWEAKS###

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

USE_CCACHE=1
