if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}misc setup${ENDCOLOR}"

install_with_package_manager pacman pulseaudio
install_with_package_manager pacman pavucontrol

install_with_package_manager pacman shotgun
install_with_package_manager pacman spotify-launcher
install_with_package_manager pacman thunar
install_with_package_manager pacman vlc
install_with_package_manager pacman discord
install_with_package_manager pacman ephoto
install_with_package_manager pacman mupdf
install_with_package_manager pacman nitrogen
install_with_package_manager pacman xclip
install_with_package_manager yay brave-bin
install_with_package_manager yay postman-bin
install_with_package_manager yay zsa-keymapp-bin
install_with_package_manager yay 1password

install_with_package_manager pacman ttf-agave-nerd
install_with_package_manager pacman noto-fonts
install_with_package_manager pacman noto-fonts-cjk
install_with_package_manager pacman inter-font
install_with_package_manager yay ttf-hackgen

install_with_package_manager pacman fcitx
install_with_package_manager pacman fcitx-qt5
install_with_package_manager pacman fcitx-qt6
install_with_package_manager pacman fcitx-configtool
install_with_package_manager pacman fcitx-mozc
echo -e "${BLUE}make sure to see application_notes/fcitx_readme.md to setup JP${ENDCOLOR}"

echo -e "${GREEN}misc setup complete${ENDCOLOR}"
