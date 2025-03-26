if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}bluetooth setup${ENDCOLOR}"

install_with_package_manager pacman bluez
install_with_package_manager pacman bluez-utils
install_with_package_manager pacman blueman
install_with_package_manager pacman pulseaudio-bluetooth

echo -e "${GREEN}bluetooth setup complete${ENDCOLOR}"
