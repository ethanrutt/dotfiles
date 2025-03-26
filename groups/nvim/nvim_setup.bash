if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}nvim setup${ENDCOLOR}"

echo -e "${YELLOW}installing nvim and dependencies${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        sudo apt-get install -y cmake
        sudo apt-get install -y curl
        sudo apt-get install -y wget
        sudo apt-get install -y unzip
        sudo apt-get install -y ripgrep
        sudo apt-get install -y gcc
        sudo apt-get install -y python3
        sudo apt-get install -y python-is-python3
        sudo apt-get install -y python3-venv
        sudo apt-get install -y default-jdk
        sudo apt-get install -y software-properties-common

        sudo add-apt-repository ppa:neovim-ppa/unstable -y
        sudo apt update
        sudo apt-get install -y neovim
    ;;
    arch)
        if ! pacman -Q cmake >/dev/null 2>&1; then
            sudo pacman -S --noconfirm cmake
        fi
        if ! pacman -Q curl >/dev/null 2>&1; then
            sudo pacman -S --noconfirm curl
        fi
        if ! pacman -Q wget >/dev/null 2>&1; then
            sudo pacman -S --noconfirm wget
        fi
        if ! pacman -Q unzip >/dev/null 2>&1; then
            sudo pacman -S --noconfirm unzip
        fi
        if ! pacman -Q ripgrep >/dev/null 2>&1; then
            sudo pacman -S --noconfirm ripgrep
        fi
        if ! pacman -Q gcc >/dev/null 2>&1; then
            sudo pacman -S --noconfirm gcc
        fi
        if ! pacman -Q python >/dev/null 2>&1; then
            sudo pacman -S --noconfirm python
        fi
        if ! pacman -Q jdk21-openjdk >/dev/null 2>&1; then
            sudo pacman -S --noconfirm jdk21-openjdk
        fi
        if ! pacman -Q neovim >/dev/null 2>&1; then
            sudo pacman -S --noconfirm neovim
        fi
    ;;
esac

if [[ -d "$HOME/.config/nvim" ]] || [[ -L "$HOME/.config/nvim" ]]; then
    echo -e "${YELLOW}removing existing .config/nvim${ENDCOLOR}"
    rm -r "$HOME/.config/nvim"
fi

echo -e "${YELLOW}linking new .config/nvim${ENDCOLOR}"
ln -s "$DOTS_DIR/groups/nvim/files/neovim-config/nvim" "$HOME/.config/nvim"

echo -e "${GREEN}nvim setup complete${ENDCOLOR}"
