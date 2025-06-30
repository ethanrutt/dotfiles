if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}bat setup${ENDCOLOR}"

case $ID in
    ubuntu|debian)
        # FIXME: look at nvm group to see how to automate this
        echo -e "${RED}Because apt sucks, you must install this manually, as the version on apt right now is incompatible with delta. Go to the releases page, download the deb file, and run \`dpkg -i file.deb\`. https://github.com/sharkdp/bat/releases${ENDCOLOR}"
    ;;
    arch)
        install_with_package_manager pacman bat
    ;;
esac

link_file "$DOTS_DIR/groups/bat/files/bat" "$HOME/.config/bat"

if command -v bat >/dev/null 2>&1; then
    echo -e "${YELLOW}building bat cache${ENDCOLOR}"
    bat cache --build >/dev/null 2>&1
fi

echo -e "${GREEN}bat setup complete${ENDCOLOR}"
