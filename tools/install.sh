source $BASHFUL_DIR/tools/backup_old_bash.sh
source $BASHFUL_DIR/tools/install_new_bash.sh
source $BASHFUL_DIR/tools/verify_bashful_installation.sh

while getopts irh opt ; do
    case $opt in
        i)
            echo "INTERACTIVE"
            ;;
        r)
            echo "RADIOACTIVE"
            ;;
        h)
            echo ""
            echo "BASHFUL INSTALLER"
            echo ""
            echo "Usage:"
            echo "  -i     Interactive installation"
            echo "  -r     Radioactive installation"
            echo ""
            ;;
    esac
done

backup_old_bashrc
backup_old_bash_profile

# rm -rf $BASHFUL_TARGET_DIR
# cp -R $BASHFUL_DIR $BASHFUL_TARGET_DIR

install_new_bashrc
install_new_bash_profile

if verify_bashful_installation; then
    echo -en "$text_green >> Installation successful.$text_reset\n"
    echo -en "You may now execute$text_yellow source $HOME/.bash_profile$text_reset\n"
else
    echo -en "$text_red >> ERROR: Installation failed.$text_reset\n"
fi
