if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}git setup${ENDCOLOR}"

if [[ $ID == "ubuntu" ]] || [[ $ID == "debian" ]]; then
    echo -e "${YELLOW}installing newer git${ENDCOLOR}"
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt update
    install_with_package_manager apt git
fi

link_file "$DOTS_DIR/groups/git/files/.gitconfig" "$HOME/.gitconfig"

echo -e "${GREEN}git setup complete${ENDCOLOR}"
