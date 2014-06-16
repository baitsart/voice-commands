#!/bin/bash

# Written by Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart 
# GNU License. You are free to modify and redistribute   # 

if 
echo $USER | grep -x "root"
then
zenity --warning --text="To install you must not be root\ntype exit and then run the installer"
exit 0
fi
if [ -d ~/.voice_commands ]
then
zenity --warning --text="To install must clear before\n $HOME/.voice_commands\nOr run this command:\nsh ~/.voice_commands/uninstall.sh\nand then run the installer"
exit 0
fi
PKG_PATH=$(dirname "$(readlink -f "$0")")
cp -R "${PKG_PATH}"/voice_commands ~/.voice_commands
idioma=$(echo $LANG | cut -d'.' -f1)
sed -i 's|es_UY|'$idioma'|g' ~/.voice_commands/voice-commands.desktop
sed -i 's|/home/pc|'$HOME'|' ~/.voice_commands/voice-commands.desktop
mv ~/.voice_commands/voice-commands.desktop  ~/.local/share/applications/voice-commands.desktop
image_folder=$(xdg-user-dir PICTURES | sed 's|'$HOME'||')
desk_folder=$(xdg-user-dir DESKTOP | sed 's|'$HOME'||')
sed -i 's|/Imágenes|'$image_folder'|g' ~/.voice_commands/speech_commands.sh
sed -i 's|/Escritorio|'$desk_folder'|g' ~/.voice_commands/speech_commands.sh
if [ -d ~/.gnome2/nautilus-scripts ]
then
echo "#!/bin/bash
sh  ~/.voice_commands/play_stop.sh
exit 0;" > ~/.gnome2/nautilus-scripts/"Voice Commands"
chmod +x ~/.gnome2/nautilus-scripts/"Voice Commands"
fi
if [ -d ~/.local/share/nautilus/scripts ]
then
echo "#!/bin/bash
sh  ~/.voice_commands/play_stop.sh
exit 0;" > ~/.local/share/nautilus/scripts/"Voice Commands"
chmod +x ~/.local/share/nautilus/scripts/"Voice Commands"
fi
cp "${PKG_PATH}"/README.md ~/.voice_commands/
echo "Installation Complete"



