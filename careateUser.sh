#!/bin/bash

USER = $1
if [[ -z "$USER" ]]; then
        echo "Usage: $0 need username"
        exit 1
fi

# if OS is debian or ubuntu
if [ -f /etc/debian_version ]; then
    #add user and add to sudo group
    sudo adduser $USER 
    sudo gpasswd -a $USER sudo
    
    #check if user is added to sudo group
    RESULT=$(cat /etc/group | grep sudo)
    PATTERN=".*${1}"
    if [[ $RESULT =~ $PATTERN ]]; then
        echo "process succeed"
    else
        echo "something wrong"
    fi
# if OS is centos or fedora
elif [ -f /etc/redhat-release ]; then
    
    #add user and add to wheel group
    sudo adduser $USER_NAME
    sudo passwd $USER_NAME    

    sudo usermod -aG wheel $USER_NAME

    #check if user is added to wheel group
    RESULT=$(cat /etc/group | grep wheel)
    PATTERN=".*${1}"

    if [[ $RESULT =~ $PATTERN ]]; then
        echo "process succeed"
    else
        echo "something wrong"
    fi

fi

