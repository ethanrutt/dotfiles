if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}delta setup${ENDCOLOR}"

case $ID in
    ubuntu|debian)
        # FIXME: look at nvm group to see how to automate this
        echo -e "${RED}Because apt sucks, you must install this manually. Download the deb file, and run \`dpkg -i file.deb\`. https://github.com/dandavison/delta/releases/${ENDCOLOR}"
    ;;
    arch)
        install_with_package_manager pacman git-delta
    ;;
esac

if command -v git >/dev/null 2>&1; then
    echo -e "${YELLOW}configuring git to use delta${ENDCOLOR}"
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global delta.side-by-side true
    git config --global delta.line-numbers true
    git config --global merge.conflictStyle zdiff3
fi

echo -e "${GREEN}delta setup complete${ENDCOLOR}"
