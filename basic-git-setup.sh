#!/bin/bash
#set -e
echo
tput setaf 3
echo "################################################################"
echo "################### Start"
echo "################################################################"
tput sgr0
echo

echo "-----------------------------------------------------------------------------"
echo "Seting up, basic github settings"
echo "-----------------------------------------------------------------------------"
git config --global user.name "KarolZygadlo"
git config --global user.email "karol.zygadlo@protonmail.com"
sudo git config --system core.editor vim

echo
tput setaf 3
echo "################################################################"
echo "################### End"
echo "################################################################"
tput sgr0
echo
