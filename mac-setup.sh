#!/bin/bash

RCol='\033[0m'
Gre='\033[0;32m'
Red='\033[0;31m'
Yel='\033[0;33m'

## printing functions ##
function gecho {
  echo "${Gre}[message] $1${RCol}"
}

function yecho {
  echo "${Yel}[warning] $1${RCol}"
}

function wecho {
  # red, but don't exit 1
  echo "${Red}[error] $1${RCol}"
}


function recho {
  echo "${Red}[error] $1${RCol}"
  exit 1
}

## install functions ##

# check for pre-req, fail if not found
function check_preq {
  (command -v $1 > /dev/null  && gecho "$1 found...") || 
    recho "$1 not found, install before proceeding."
}

# look for command line tool, if not install via homebrew
function install_brew {
  (command -v $1 > /dev/null  && gecho "$1 found...") || 
    (yecho "$1 not found, installing via homebrew..." && brew install $1)
}

# function for linking dotfiles
function linkdotfile {
  file="$1"
  if [ ! -e ~/$file -a ! -L ~/$file ]; then
      yecho "$file not found, linking..." >&2
      ln -s ~/dotfiles/$file ~/$file
  else
      gecho "$file found, ignoring..." >&2
  fi
}

# are we in right directory?
[[ $(basename $(pwd)) == "computer-configs" ]] || 
  recho "doesn't look like you're in the computer-configs directory"

# check that the key pre-requisites are met:
check_preq brew
# check_preq R
# check_preq

# install Homebrew main programs
install_brew tmux


# link over .gitconfig
linkdotfile .gitconfig
linkdotfile .gitattributes

# link over .tmux.conf
linkdotfile .tmux.conf

# create Python setup
# linkdotfile .ipython
# linkdotfile .ptpython
# linkdotfile .condarc


# create a Rprofile
linkdotfile .Rprofile


# iterm integration
linkdotfile .iterm2_shell_integration.zsh

# create a global Git ignore file
if [ ! -e ~/.global_ignore ]; then
    yecho "~/.global_ignore not found, curling from Github..." >&2
    curl \
      https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore \
      https://raw.githubusercontent.com/github/gitignore/master/R.gitignore
      https://raw.githubusercontent.com/github/gitignore/master/Global/Dropbox.gitignore \
      https://raw.githubusercontent.com/github/gitignore/master/Global/MicrosoftOffice.gitignore \
    > ~/.global_ignore 2> /dev/null
    git config --global core.excludesfile ~/.global_ignore && 
      yecho "[message] adding ignore file to Git..." >&2
else
    gecho "~/.global_ignore found, ignoring..." >&2
fi


# install some R packages
#gecho "installing R packages" >&2
# Rscript ~/dotfiles/install_rpkgs.r



