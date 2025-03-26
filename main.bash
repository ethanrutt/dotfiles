#!/usr/bin/env bash

# FIXME: uncomment
# DOTS_DIR="$HOME/.dots"
DOTS_DIR="$HOME/projects/dots_rewrite"

RED="\e[31m" # errors
GREEN="\e[32m" # successful roles
YELLOW="\e[33m" # warnings / skips
BLUE="\e[34m" # pre-setup messages
MAGENTA="\e[35m" # starting new role
CYAN="\e[36m" # variables
ENDCOLOR="\e[0m"

source /etc/os-release
echo -e "${BLUE}Loading Setup for detected OS:${ENDCOLOR} ${CYAN}${ID}${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        if ! dpkg -s git >/dev/null 2>&1; then
            echo "${BLUE}Installing git${ENDCOLOR}"
            sudo apt-get install -y git
        fi
    ;;
    arch)
        echo -e "${BLUE}Setting Locale${ENDCOLOR}"
        sudo localectl set-locale LANG=en_US.UTF-8

        if ! pacman -Q git >/dev/null 2>&1; then
            echo "${BLUE}Installing git${ENDCOLOR}"
            sudo pacman -S --noconfirm git
        fi
    ;;
  *)
      echo -e "${RED}Unsupported OS${ENDCOLOR}"
      exit 1
  ;;
esac

# FIXME: uncomment
# if ! [[ -d "$DOTS_DIR" ]]; then
#     echo -e "${BLUE}Cloning repository${ENDCOLOR}"
#     git clone --recurse-submodules git@github.com:ethanrutt/dots.git "$DOTS_DIR"
# else
#     echo -e "${BLUE}Updating repository${ENDCOLOR}"
#     git -C "$DOTS_DIR" pull --recurse-submodules --quiet
# fi

if ! [[ -d "$HOME/.config" ]]; then
    mkdir "$HOME/.config"
fi

# FIXME: need bash dependencies before
source "$DOTS_DIR/groups/bat/bat_setup.bash"
source "$DOTS_DIR/groups/eza/eza_setup.bash"
source "$DOTS_DIR/groups/tmux/tmux_setup.bash"
source "$DOTS_DIR/groups/bash/bash_setup.bash"
