if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}bash setup${ENDCOLOR}"

if [[ -f "$HOME/.bashrc" ]]; then
    echo -e "${YELLOW}removing existing .bashrc${ENDCOLOR}"
    rm "$HOME/.bashrc"
fi

if [[ -f "$HOME/.bash_profile" ]]; then
    echo -e "${YELLOW}removing existing .bash_profile${ENDCOLOR}"
    rm "$HOME/.bash_profile"
fi

if [[ -d "$HOME/.config/bash" ]] || [[ -L "$HOME/.config/bash" ]]; then
    echo -e "${YELLOW}removing existing .config/bash${ENDCOLOR}"
    rm -r "$HOME/.config/bash"
fi

echo -e "${YELLOW}linking new .bashrc${ENDCOLOR}"
ln -s "$DOTS_DIR/groups/bash/files/.bashrc" "$HOME/.bashrc"

echo -e "${YELLOW}linking new .config/bash${ENDCOLOR}"
ln -s "$DOTS_DIR/groups/bash/files/bash" "$HOME/.config/bash"

echo -e "${YELLOW}linking new .bash_profile${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        ln -s "$DOTS_DIR/groups/bash/files/debian/.bash_profile" "$HOME/.bash_profile"
    ;;
    arch)
        ln -s "$DOTS_DIR/groups/bash/files/arch/.bash_profile" "$HOME/.bash_profile"
    ;;
esac

echo -e "${GREEN}bash setup complete${ENDCOLOR}"
