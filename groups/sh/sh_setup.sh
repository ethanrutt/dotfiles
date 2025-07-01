if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}sh setup${ENDCOLOR}"

mkdir -p $HOME/.config/bash
mkdir -p $HOME/.config/zsh

link_file "$DOTS_DIR/groups/sh/files/sh/ethanrutt.sh" "$HOME/.config/bash/ethanrutt.sh"
link_file "$DOTS_DIR/groups/sh/files/sh/tmuxster.sh" "$HOME/.config/bash/tmuxster.sh"
link_file "$DOTS_DIR/groups/sh/files/sh/ethanrutt.sh" "$HOME/.config/zsh/ethanrutt.sh"
link_file "$DOTS_DIR/groups/sh/files/sh/tmuxster.sh" "$HOME/.config/zsh/tmuxster.sh"

echo -e "${RED}you probably want to make sure the files in ~/.config/[zsh|bash] are getting sourced so that you have your aliases${ENDCOLOR}"

echo -e "${GREEN}sh setup complete${ENDCOLOR}"
