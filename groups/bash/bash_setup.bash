if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}bash setup${ENDCOLOR}"

link_file "$DOTS_DIR/groups/bash/files/.bashrc" "$HOME/.bashrc"
link_file "$DOTS_DIR/groups/bash/files/bash" "$HOME/.config/bash"

case $ID in
    ubuntu|debian)
        link_file "$DOTS_DIR/groups/bash/files/debian/.bash_profile" "$HOME/.bash_profile"
    ;;
    arch)
        link_file "$DOTS_DIR/groups/bash/files/arch/.bash_profile" "$HOME/.bash_profile"
    ;;
esac

echo -e "${GREEN}bash setup complete${ENDCOLOR}"
