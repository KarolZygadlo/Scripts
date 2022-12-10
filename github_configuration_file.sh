#!/bin/bash

echo "Git configuration process"
echo "What's your git username"
read USER
DEFAULT_EMAIL="$USER@users.noreply.github.com"
read -p "What's your git email [Press enter to accept the private email $DEFAULT_EMAIL]: " EMAIL
EMAIL="${EMAIL:-${DEFAULT_EMAIL}}"

echo "Configuring global user name and email..."
git config --global user.name "$USER"
git config --global user.email "$EMAIL"

read -r -p "Do you want to add ssh credentials for git? [y/n] " RESP
RESP=${RESP,,}    # tolower (only works with /bin/bash)

CHECK_KEY_ED_EXISTS="$HOME/.ssh/id_ed25519.pub"
if [[ $RESP =~ ^(yes|y)$ ]] && ! test -f "$CHECK_KEY_ED_EXISTS"
then
    echo "Configuring git ssh access..."
    ssh-keygen -t ed25519 -C "$EMAIL"
    echo "This is your public key, add it to your account:"
    cat ~/.ssh/id_ed25519.pub
elif [[ $RESP =~ ^(yes|y)$ ]] && test -f "$CHECK_KEY_ED_EXISTS"
then
    echo "You have already ssh-key, add it to your account"
    cat ~/.ssh/id_ed25519.pub
fi

echo ""
echo "git configured"
