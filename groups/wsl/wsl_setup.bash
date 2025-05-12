if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}wsl setup${ENDCOLOR}"

sudo add-apt-repository ppa:wslutilities/wslu -y
sudo apt update
install_with_package_manager apt wslu

echo -e "${GREEN}wsl setup complete${ENDCOLOR}"
