#!/bin/bash

## This script is for installing essential video game emulators

##Arrays for containing specific consoles - Will be used to install specific console emulators
EMULATORS_NINTENDO=("NES" "SNES" "N64" "GAMECUBE/WII" "WIIU" "SWITCH" "GAMEBOY" "GBA" "NDS" "3DS")
EMULATORS_SONY=("PS1" "PS2" "PS3" "PSP")
EMULATORS_SEGA=("MASTER_SYSTEM" "GENESIS" "GAME_GEAR" "DREAMCAST")

##Show welcome message
echo "Welcome to the Emulator Installer! Hello!"

echo "Type in nintendo, sony, or sega to install specific manufacturer emulators."

prompt_user_emulator_install() {

    ##Yes or No
    read -p 'Y | N: ' yes_or_no

    if [ "$yes_or_no" == "Y" ]; then
        return_result=1
    elif [ "$yes_or_no" == "N" ]; then
        return_result=0
    else
        echo "ERROR: Wrong input!"
        exit 1
    fi

    echo "$return_result"
}

sony() {
    for console in "${EMULATORS_SONY[@]}"; do

        echo "Console: ${console}"

        result="$(prompt_user_emulator_install)"

        echo "Result: ${result}"

        if [ "$result" == 1 ]; then
            echo "Will install emulator for ${console}"

            ##Execute specific install script for the console emulator
            bash ./install/"${console}"/install.sh
        fi
    done 
}