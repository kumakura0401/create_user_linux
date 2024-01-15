#!/bin/bash

USER = $1
if [[ -z "$USER" ]]; then
        echo "Usage: $0 need username"
        exit 1
fi

# if OS is debian or ubuntu
if [ -f /etc/debian_version ]; then

    sudo adduser $USER 
    sudo gpasswd -a $USER sudo

    #cat /etc/passwd | grep $USER
    #cat /etc/group | grep sudo 

    RESULT=$(cat /etc/group | grep sudo)
    PATTERN=".*${1}"

    if [[ $RESULT =~ $PATTERN ]]; then
        echo "process succeed"
    else
        echo "something wrong"
    fi
# if OS is centos or fedora
elif [ -f /etc/redhat-release ]; then

    sudo adduser $USER_NAME
    sudo passwd $USER_NAME    

    sudo usermod -aG wheel $USER_NAME

    RESULT=$(cat /etc/group | grep wheel)
    PATTERN=".*${1}"

    if [[ $RESULT =~ $PATTERN ]]; then
        echo "process succeed"
    else
        echo "something wrong"
    fi

fi
