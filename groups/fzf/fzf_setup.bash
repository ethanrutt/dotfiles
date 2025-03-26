if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}fzf setup${ENDCOLOR}"

echo -e "${YELLOW}installing fzf${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        if dpkg -s fzf >/dev/null 2>&1; then
            sudo apt-get remove -y fzf
        fi

        if ! [[ -d "$HOME/.fzf" ]]; then
            git clone --quiet https://github.com/junegunn/fzf.git "$HOME/.fzf"
            "$HOME/.fzf/install"
        fi
    ;;
    arch)
        if ! pacman -Q fzf >/dev/null 2>&1; then
            sudo pacman -S --noconfirm fzf
        fi
    ;;
esac

echo -e "${YELLOW}installing fzf-git${ENDCOLOR}"
if ! [[ -d "$HOME/.fzf-git" ]]; then
    git clone --quiet https://github.com/junegunn/fzf-git.sh.git "$HOME/.fzf-git"
fi

echo -e "${GREEN}fzf setup complete${ENDCOLOR}"
