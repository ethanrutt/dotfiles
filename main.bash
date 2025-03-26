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

# usage: install_with_package_manager <package_manager> <package>
function install_with_package_manager() {
    if [[ -z "$1" ]]; then
        echo -e "${RED}first positional argument (package manager) missing${ENDCOLOR}"
        return 1
    fi

    if [[ -z "$2" ]]; then
        echo -e "${RED}second positional argument (package) missing${ENDCOLOR}"
        return 1
    fi

    echo -e "${YELLOW}installing $2 with $1${ENDCOLOR}"
    case $1 in
        pacman)
            if ! pacman -Q "$2" >/dev/null 2>&1; then
                sudo pacman -S --noconfirm "$2"
            fi
        ;;
        apt|apt-get)
            if ! dpkg -s "$2" >/dev/null 2>&1; then
                sudo apt-get install -y "$2"
            fi
        ;;
        *)
            echo -e "${RED}unsupported package manager:${ENDCOLOR} ${CYAN}$1${ENDCOLOR}"
            return 1
        ;;
    esac
}

# usage: link_file <src_file> <link_dest>
function link_file() {
    if [[ -z "$1" ]]; then
        echo -e "${RED}first positional argument (src_file) missing${ENDCOLOR}"
        return 1
    fi

    if [[ -z "$2" ]]; then
        echo -e "${RED}second positional argument (link_dest) missing${ENDCOLOR}"
        return 1
    fi

    if [[ -f "$2" ]] || [[ -d "$2" ]] || [[ -L "$2" ]]; then
        echo -e "${YELLOW}removing existing $2${ENDCOLOR}"
        rm -r "$2"
    fi

    echo -e "${YELLOW}linking new $1${ENDCOLOR}"
    ln -s "$1" "$2"
}

source /etc/os-release
echo -e "${BLUE}loading Setup for detected os:${ENDCOLOR} ${CYAN}${ID}${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        echo -e "${BLUE}update all packages${ENDCOLOR}"
        sudo apt update && sudo apt upgrade
        install_with_package_manager apt git
    ;;
    arch)
        echo -e "${BLUE}update all packages${ENDCOLOR}"
        sudo pacman -Syu

        echo -e "${BLUE}setting locale${ENDCOLOR}"
        sudo localectl set-locale LANG=en_US.UTF-8

        install_with_package_manager pacman git
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

# terminal tools
source "$DOTS_DIR/groups/git/git_setup.bash"
source "$DOTS_DIR/groups/delta/delta_setup.bash"
source "$DOTS_DIR/groups/bat/bat_setup.bash"
source "$DOTS_DIR/groups/eza/eza_setup.bash"
source "$DOTS_DIR/groups/tmux/tmux_setup.bash"
source "$DOTS_DIR/groups/fd/fd_setup.bash"
source "$DOTS_DIR/groups/fzf/fzf_setup.bash"
source "$DOTS_DIR/groups/bash/bash_setup.bash"

# nvim
source "$DOTS_DIR/groups/nvm/nvm_setup.bash"
source "$DOTS_DIR/groups/nvim/nvim_setup.bash"

if [[ "$ID" == "arch" ]]; then
    source "$DOTS_DIR/groups/yay/yay_setup.bash"
fi

if [[ $(systemd-detect-virt) == "none" ]] && [[ "$ID" == "arch" ]]; then
    source "$DOTS_DIR/groups/awesome/awesome_setup.bash"
    source "$DOTS_DIR/groups/alacritty/alacritty_setup.bash"
    source "$DOTS_DIR/groups/obsidian/obsidian_setup.bash"
    # pulseaudio here
    source "$DOTS_DIR/groups/bluetooth/bluetooth_setup.bash"
fi
