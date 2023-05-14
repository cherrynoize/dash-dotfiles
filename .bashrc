#
# ~/.bashrc
#

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Source aliases
[[ -f ".bash_aliases" ]] && . ".bash_aliases"

# Primary command prompt
PS1='[\u@\h \W]\$ '

# Colors for ls.
LS_COLORS=$LS_COLORS:'ow=1;30;47:di=1;33:fi=1;36:ln=1;5:'; export LS_COLORS

# Looks for binary in packages (when command not found)
. /usr/share/doc/pkgfile/command-not-found.bash

# Autochange directory when entering a path
shopt -s autocd

# Autoupdate LINES and COLUMNS on window resize
shopt -s checkwinsize

# Do not overwrite files with stdout.
# Manually override noclobber option with
#  $ echo "output" >| file.txt
set -o noclobber

# Vi editing mode
set -o vi

# Bash git prompt
if [ -f "$HOME/.config/bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.config/bash-git-prompt/gitprompt.sh
fi

# Run fish if not child of fish already and if not run with bash -c for instance.
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
	exec fish
fi
