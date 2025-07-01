if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}nvm setup${ENDCOLOR}"

case $ID in
    ubuntu|debian)
        install_with_package_manager apt curl
        install_with_package_manager apt python3
    ;;
    arch)
        install_with_package_manager pacman curl
        install_with_package_manager pacman python
    ;;
esac

echo -e "${YELLOW}getting latest nvm version${ENDCOLOR}"
nvm_latest_version=$(curl -s 'https://api.github.com/repos/nvm-sh/nvm/releases/latest' | \
    python3 -c "import sys, json; print(json.load(sys.stdin)['tag_name'])")

echo -e "${YELLOW}latest nvm version:${ENDCOLOR} ${CYAN}${nvm_latest_version}${ENDCOLOR}"

mkdir -p "$HOME/.nvm"
export NVM_DIR="$HOME/.nvm"

echo -e "${YELLOW}installing nvm version:${ENDCOLOR} ${CYAN}${nvm_latest_version}${ENDCOLOR}"
PROFILE=/dev/null bash -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_latest_version}/install.sh | bash"
source "$NVM_DIR/nvm.sh"

if ! command -v nvm >/dev/null 2>&1; then
    echo -e "${RED}nvm install failed${ENDCOLOR}"
    exit 1
fi

echo -e "${YELLOW}installing node${ENDCOLOR}"
nvm install node
echo -e "${YELLOW}using node${ENDCOLOR}"
nvm use node
echo -e "${YELLOW}installing npm${ENDCOLOR}"
nvm install-latest-npm

echo -e "${GREEN}nvm setup complete${ENDCOLOR}"
