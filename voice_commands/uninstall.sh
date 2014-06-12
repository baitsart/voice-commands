#!/bin/bash

# Written by Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart 
# GNU License. You are free to modify and redistribute   # 

if 
echo $USER | grep -x "root"
then
zenity --warning --text="To install you must not be root\ntype exit and then run the installer"
exit 0
fi

if [ -f ~/.local/share/applications/voice-commands.desktop ]
then
rm ~/.local/share/applications/voice-commands.desktop
fi
if [ -f  ~/.gnome2/nautilus-scripts/"Voice Commands" ]
then
rm ~/.gnome2/nautilus-scripts/"Voice Commands"
fi
if [ -f ~/.local/share/nautilus/scripts/"Voice Commands" ]
then
rm ~/.local/share/nautilus/scripts/"Voice Commands"
fi
if [ -d ~/.voice_commands ]
then
rm -rf ~/.voice_commands
fi
echo "Uninstallation complete"
