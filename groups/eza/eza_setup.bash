if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}eza setup${ENDCOLOR}"

case $ID in
    ubuntu|debian)
        if ! dpkg -s eza >/dev/null 2>&1; then
            # see eza INSTALL.md
            install_with_package_manager apt gpg
            echo -e "${YELLOW}setting up keyrings${ENDCOLOR}"
            sudo mkdir -p /etc/apt/keyrings
            echo -e "${YELLOW}getting eza gpg${ENDCOLOR}"
            wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
            echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
            sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list

            sudo apt update
            install_with_package_manager apt eza
        fi
    ;;
    arch)
        install_with_package_manager pacman eza
    ;;
esac

echo -e "${GREEN}eza setup complete${ENDCOLOR}"
