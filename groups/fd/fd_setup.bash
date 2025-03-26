if [[ -z "$DOTS_DIR" ]] || [[ -z "$ID" ]]; then
    echo -e "\e[31m\$DOTS_DIR or \$ID is an empty string. This file should only be called from dots/main.bash. If not, then there will be undefined variables that are needed to execute properly.\e[0m"
    exit 1
fi

echo -e "\n\n${MAGENTA}fd setup${ENDCOLOR}"

case $ID in
    ubuntu|debian)
        install_with_package_manager apt fd-find

        if command -v fd >/dev/null 2>&1; then
            # FIXME: read echo
            echo -e "${RED}FIXME figure out how to link this in debian${ENDCOLOR}"
        fi
    ;;
    arch)
        install_with_package_manager pacman fd
    ;;
esac

echo -e "${GREEN}fd setup complete${ENDCOLOR}"
