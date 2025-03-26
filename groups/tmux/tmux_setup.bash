if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}tmux setup${ENDCOLOR}"

echo -e "${YELLOW}installing tmux${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        if ! dpkg -s tmux >/dev/null 2>&1; then
            sudo apt-get install -y tmux
        fi
    ;;
    arch)
        if ! pacman -Q tmux >/dev/null 2>&1; then
            sudo pacman -S --noconfirm tmux
        fi
    ;;
esac

if [[ -d "$HOME/.config/tmux" ]] || [[ -L "$HOME/.config/tmux" ]]; then
    echo -e "${YELLOW}removing existing .config/tmux${ENDCOLOR}"
    rm -r "$HOME/.config/tmux"
fi

echo -e "${YELLOW}linking new .config/tmux${ENDCOLOR}"
ln -s "$DOTS_DIR/groups/tmux/files/tmux" "$HOME/.config/tmux"

echo -e "${GREEN}tmux setup complete${ENDCOLOR}"
