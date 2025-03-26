if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}nvim setup${ENDCOLOR}"

echo -e "${YELLOW}installing nvim and dependencies${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        install_with_package_manager apt cmake
        install_with_package_manager apt curl
        install_with_package_manager apt wget
        install_with_package_manager apt zip
        install_with_package_manager apt unzip
        install_with_package_manager apt ripgrep
        install_with_package_manager apt gcc
        install_with_package_manager apt python3
        install_with_package_manager apt python-is-python3
        install_with_package_manager apt python3-venv
        install_with_package_manager apt default-jdk
        install_with_package_manager apt software-properties-common

        sudo add-apt-repository ppa:neovim-ppa/unstable -y
        sudo apt update
        install_with_package_manager apt neovim
    ;;
    arch)
        install_with_package_manager pacman cmake
        install_with_package_manager pacman curl
        install_with_package_manager pacman wget
        install_with_package_manager pacman zip
        install_with_package_manager pacman unzip
        install_with_package_manager pacman ripgrep
        install_with_package_manager pacman gcc
        install_with_package_manager pacman python
        install_with_package_manager pacman jdk21-openjdk
        install_with_package_manager pacman neovim
    ;;
esac

link_file "$DOTS_DIR/groups/nvim/files/neovim-config/nvim" "$HOME/.config/nvim"

echo -e "${GREEN}nvim setup complete${ENDCOLOR}"
