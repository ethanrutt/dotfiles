if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}wallpapers setup${ENDCOLOR}"

mkdir -p "$HOME/Pictures"
link_file "$DOTS_DIR/groups/wallpapers/files/wallpapers" "$HOME/Pictures/wallpapers_ethanrutt"

echo -e "${GREEN}wallpapers setup complete${ENDCOLOR}"
