if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}obsidian setup${ENDCOLOR}"

install_with_package_manager pacman obsidian

mkdir -p "$HOME/Documents"
link_file "$DOTS_DIR/groups/obsidian/files/obsidian_vaults" "$HOME/Documents"

echo -e "${GREEN}obsidian setup complete${ENDCOLOR}"
