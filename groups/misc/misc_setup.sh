if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}misc setup${ENDCOLOR}"

# packages
install_with_package_manager pacman spotify-launcher
install_with_package_manager pacman discord
install_with_package_manager pacman bitwarden
install_with_package_manager pacman steam
install_with_package_manager yay zsa-keymapp-bin

# japanese IME
install_with_package_manager pacman fcitx5
install_with_package_manager pacman fcitx5-qt
install_with_package_manager pacman fcitx5-gtk
install_with_package_manager pacman fcitx5-configtool
install_with_package_manager pacman fcitx5-mozc
echo -e "${BLUE}make sure to see application_notes/fcitx_readme.md to setup JP${ENDCOLOR}"

echo -e "${GREEN}misc setup complete${ENDCOLOR}"
