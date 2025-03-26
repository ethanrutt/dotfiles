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
echo -e "${BLUE}loading Setup for detected os:${ENDCOLOR} ${CYAN}${ID}${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        echo -e "${BLUE}update all packages${ENDCOLOR}"
        sudo apt update && sudo apt upgrade
        if ! dpkg -s git >/dev/null 2>&1; then
            echo -e "${BLUE}Installing git${ENDCOLOR}"
            sudo apt-get install -y git
        fi
    ;;
    arch)
        echo -e "${BLUE}update all packages${ENDCOLOR}"
        sudo pacman -Syu

        echo -e "${BLUE}setting locale${ENDCOLOR}"
        sudo localectl set-locale LANG=en_US.UTF-8

        if ! pacman -Q git >/dev/null 2>&1; then
            echo -e "${BLUE}installing git${ENDCOLOR}"
            sudo pacman -S --noconfirm git
        fi
    ;;
  *)
      echo -e "${RED}unsupported os${ENDCOLOR}"
      exit 1
  ;;
esac

# FIXME: uncomment
# if ! [[ -d "$DOTS_DIR" ]]; then
#     echo -e "${BLUE}cloning repository${ENDCOLOR}"
#     git clone --recurse-submodules git@github.com:ethanrutt/dots.git "$DOTS_DIR"
# else
#     echo -e "${BLUE}updating repository${ENDCOLOR}"
#     git -C "$DOTS_DIR" pull --recurse-submodules --quiet
# fi

if ! [[ -d "$HOME/.config" ]]; then
    mkdir "$HOME/.config"
fi

source "$DOTS_DIR/groups/git/git_setup.bash"
source "$DOTS_DIR/groups/bat/bat_setup.bash"
source "$DOTS_DIR/groups/eza/eza_setup.bash"
source "$DOTS_DIR/groups/tmux/tmux_setup.bash"
source "$DOTS_DIR/groups/fd/fd_setup.bash"
source "$DOTS_DIR/groups/fzf/fzf_setup.bash"
source "$DOTS_DIR/groups/bash/bash_setup.bash"
