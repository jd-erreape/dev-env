#!/bin/bash

echo start_shell_provision

SSH_DIR='/home/vagrant/.ssh'
SSH_FILE='/home/vagrant/.ssh/known_hosts'
GITHUB_DOMAIN='github.com'

# Add github public key to known hosts
mkdir -p $SSH_DIR
touch $SSH_FILE 
ssh-keyscan -H $GITHUB_DOMAIN >> $SSH_FILE

# Install my dotfiles
cd /home/vagrant
git clone git@github.com:jd-erreape/dotfiles.git
cd dotfiles && chmod 777 install.sh && ./install.sh

echo end_shell_provision
