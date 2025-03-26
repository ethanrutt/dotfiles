if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}bat setup${ENDCOLOR}"

echo -e "${YELLOW}installing bat${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        echo -e "${RED}Because apt sucks, you must install this manually, as the version on apt right now is incompatible with delta. Go to the releases page, download the deb file, and run \`dpkg -i file.deb\`. https://github.com/sharkdp/bat/releases${ENDCOLOR}"
    ;;
    arch)
        if ! pacman -Q bat >/dev/null 2>&1; then
            sudo pacman -S --noconfirm bat
        fi
    ;;
esac

if [[ -d "$HOME/.config/bat" ]] || [[ -L "$HOME/.config/bat" ]]; then
    echo -e "${YELLOW}removing existing bat config${ENDCOLOR}"
    rm -r "$HOME/.config/bat"
fi

echo -e "${YELLOW}linking new bat config${ENDCOLOR}"
ln -s "$DOTS_DIR/groups/bat/files/bat" "$HOME/.config/bat"

if command -v bat >/dev/null 2>&1; then
    echo -e "${YELLOW}building bat cache${ENDCOLOR}"
    bat cache --build >/dev/null 2>&1
fi

echo -e "${GREEN}bat setup complete${ENDCOLOR}"
