if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}nvm setup${ENDCOLOR}"

echo -e "${YELLOW}installing curl and python3${ENDCOLOR}"
case $ID in
    ubuntu|debian)
        if ! command -v curl >/dev/null 2>&1; then
            sudo apt-get install -y curl
        fi

        if ! command -v python3 >/dev/null 2>&1; then
            sudo apt-get install -y python3
        fi
    ;;
    arch)
        if ! command -v curl >/dev/null 2>&1; then
            sudo pacman -S --noconfirm curl
        fi

        if ! command -v python3 >/dev/null 2>&1; then
            sudo pacman -S --noconfirm python
        fi
    ;;
esac

echo -e "${YELLOW}getting latest nvm version${ENDCOLOR}"
nvm_latest_version=$(curl -s 'https://api.github.com/repos/nvm-sh/nvm/releases/latest' | \
    python3 -c "import sys, json; print(json.load(sys.stdin)['tag_name'])")

echo -e "${YELLOW}latest nvm version:${ENDCOLOR} ${CYAN}${nvm_latest_version}${ENDCOLOR}"

echo -e "${YELLOW}installing nvm version:${ENDCOLOR} ${CYAN}${nvm_latest_version}${ENDCOLOR}"
PROFILE=/dev/null bash -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_latest_version}/install.sh | bash"
source "$HOME/.nvm/nvm.sh"

if ! command -v nvm; then
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
