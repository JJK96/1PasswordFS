#!/usr/bin/env bash

function check_brew {
    if ! command -v brew &> /dev/null
    then
        echo "Brew not installed, please install Brew first."
        exit
    fi
}

function check_pip {
    if ! command -v pip &> /dev/null
    then
        echo "Pip not installed, please install Python3 and pip first."
        exit
    fi
}

if ! [ -e "/dev/macfuse0" ]
then
    echo "Macfuse is not installed, installing ..."
    check_brew
    brew install --cask macfuse
fi

if ! command -v command_fs &> /dev/null
then
    echo "CommandFS not installed, installing ..."
    check_pip
    pip install https://github.com/JJK96/CommandFS
fi

if ! command -v op &> /dev/null
then
    echo "1password-cli not installed, installing ..."
    check_brew
    brew install --cask 1password-cli
fi

echo "You are all set!"
