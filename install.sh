#!/bin/bash

###########################
#Doc & Usage
###########################
: <<'USAGE'
@TODO
USAGE

###########################
#Configuration
###########################
BASEDIR=$(dirname $0)
BACKUPDIR="~/.dotfilesbak"
GIT_USERNAME="ioExpander"
GIT_EMAIL="ioExpander@users.noreply.github.com"

#echo $BASEDIR
cd $BASEDIR
BASEDIR=$(pwd)

#Check Installed programs
for PROG in wget zsh vim exa rg brew fzf; do
    which $PROG >/dev/null || {
        echo "Please install $PROG"
        exit 1
    }
done

#Initiate private zshconfig file with current user name
if [ ! -f ~/.zshrc_privateSettings ]; then
    echo "DEFAULT_USER=$(whoami)" >~/.zshrc_privateSettings
fi


# configure git
git config --global color.ui true
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=7200"
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL

# Linking files
ln -fs $BASEDIR/vimrc ~/.vimrc

#Copy Zshrc file
ln -fs $BASEDIR/zshrc ~/.zshrc