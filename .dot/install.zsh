#!/usr/bin/env zsh
#!/bin/zsh
#   _____          _        _ _
#  |_   _|        | |      | | |
#    | | _ __  ___| |_ __ _| | |
#    | || '_ \/ __| __/ _` | | |
#   _| || | | \__ \ || (_| | | |
#   \___/_| |_|___/\__\__,_|_|_|
#
# https://patorjk.com/software/taag/#p=display&c=bash&f=Doom&t=Install
### Install basic tools

## Autoload zsh functions
#################################################
autoload -U colors && colors

## Export work folders
#################################################
export XDG_CONFIG_HOME=$HOME/.dot
export XDG_DATA_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"/data

# ZSH specifi dirs
export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"/zsh

printf "\n$fg[green]Clone: Onfroygmx/zsh$reset_color\n"
git clone --bare https://github.com/Onfroygmx/zsh.git $HOME/.dotgit
git --git-dir=$HOME/.dotgit --work-tree=$HOME checkout

printf "\n$fg[green]Symlink zshenv file$reset_color\n"
## Set zshenv file
[[ ! -f $HOME/.zshenv && -f $ZDOTDIR/zshenv ]] && ln -s $ZDOTDIR/zshenv $HOME/.zshenv

printf "\n$fg[green]Create other folders$reset_color\n"
# Create plugins dir
PLUGINS_DIR="$XDG_CONFIG_HOME/plugins"
[[ ! -d "$PLUGINS_DIR" ]] && mkdir -p $PLUGINS_DIR


printf "\n$fg[green]Set permission 700 to all created folders$reset_color\n"
find $XDG_CONFIG_HOME -type d -print0 | xargs -0 chmod 700
mv .dotgit $XDG_CONFIG_HOME
