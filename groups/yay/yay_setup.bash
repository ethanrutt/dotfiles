if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}yay setup${ENDCOLOR}"

install_with_package_manager pacman base-devel

if ! command -v yay >/dev/null 2>&1; then
	if ! [[ -d "$HOME/.yay-bin" ]]; then
	    echo -e "${YELLOW}cloning yay${ENDCOLOR}"
	    git clone --quiet https://aur.archlinux.org/yay-bin.git "$HOME/.yay-bin"
	fi
	echo -e "${YELLOW}installing yay${ENDCOLOR}"
	pushd "$HOME/.yay-bin"
	makepkg -si --noconfirm
	popd
fi

echo -e "${GREEN}yay setup complete${ENDCOLOR}"
