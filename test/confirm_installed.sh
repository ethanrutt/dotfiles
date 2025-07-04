if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

function check_installed() {
    if [[ -z "$1" ]]; then
        echo -e "${RED}first positional argument (package) missing${ENDCOLOR}"
        return 1
    fi

    echo -e "${YELLOW}checking installation of${ENDCOLOR} ${CYAN}$1${ENDCOLOR}"

    case "$ID" in
        arch)
            if ! pacman -Q "$1" >/dev/null 2>&1 && ! command -v "$1" >/dev/null 2>&1; then
                echo -e "${RED}the package${ENDCOLOR} ${CYAN}$1${ENDCOLOR} ${RED}is missing${ENDCOLOR}"
                exit 1
            fi
        ;;
        ubuntu|debian)
            if ! dpkg -s "$1" >/dev/null 2>&1 && ! command -v "$1" >/dev/null 2>&1; then
                echo -e "${RED}the package${ENDCOLOR} ${CYAN}$1${ENDCOLOR} ${RED}is missing${ENDCOLOR}"
                exit 1
            fi
        ;;
    esac

    echo -e "${GREEN}installed${ENDCOLOR}"

    return 0
}

check_installed git
check_installed git-delta
check_installed bat
check_installed eza
check_installed tmux
check_installed fd
check_installed fzf
check_installed nvm
check_installed nvim

if [[ "$ID" == "arch" ]]; then
    check_installed yay
fi

if [[ $(systemd-detect-virt) == "none" ]] && [[ "$ID" == "arch" ]]; then
    check_installed spotify-launcher
    check_installed discord
    check_installed bitwarden
    check_installed zsa-keymapp-bin
    check_installed fcitx5
    check_installed fcitx5-qt
    check_installed fcitx5-gtk
    check_installed fcitx5-configtool
    check_installed fcitx5-mozc
    check_installed obsidian
fi

echo -e "${GREEN}looks like all programs are installed. make sure to confirm they are all configured${ENDCOLOR}"
