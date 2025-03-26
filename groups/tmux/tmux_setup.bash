if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}tmux setup${ENDCOLOR}"

case $ID in
    ubuntu|debian)
        install_with_package_manager apt tmux
    ;;
    arch)
        install_with_package_manager pacman tmux
    ;;
esac

link_file "$DOTS_DIR/groups/tmux/files/tmux" "$HOME/.config/tmux"

echo -e "${GREEN}tmux setup complete${ENDCOLOR}"
