if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31mDOTS_DIR is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly\e[0m"
    exit 1
fi

if [[ -f "$HOME/.bashrc" ]]; then
    rm "$HOME/.bashrc"
fi

if [[ -f "$HOME/.bash_profile" ]]; then
    rm "$HOME/.bash_profile"
fi

if [[ -d "$HOME/.config/bash " ]] || [[ -L "$HOME/.config/bash" ]]; then
    rm -r "$HOME/.config/bash"
fi

ln -s "$DOTS_DIR/groups/bash/files/.bashrc" "$HOME/.bashrc"
ln -s "$DOTS_DIR/groups/bash/files/bash" "$HOME/.config/bash"

case $ID in
  ubuntu|debian)
      ln -s "$DOTS_DIR/groups/bash/files/debian/.bash_profile" "$HOME/.bash_profile"
    ;;
  arch)
      ln -s "$DOTS_DIR/groups/bash/files/arch/.bash_profile" "$HOME/.bash_profile"
    ;;
esac
