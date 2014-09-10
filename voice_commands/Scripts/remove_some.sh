#!/bin/bash
TO="en"
if [ -n "$1" ]; then
string="$1"
fi
[ -d ~/.voice_commands/Scripts/New_actions ] || mkdir ~/.voice_commands/Scripts/New_actions/
actions_new=$(echo `ls -1  ~/.voice_commands/Scripts/New_actions/`)
if [ -z "$actions_new" ] ; then
	notify-send "Is no any new command: $string" "You can remove some action, created by yourself"
exit
fi

if ls -1  ~/.voice_commands/Scripts/New_actions/ | grep -q -x "$string"; then
if zenity --question --text="Do you want to remove: $string command ?";then
[ -d ~/.voice_commands/Scripts/New_actions/.old ] || mkdir ~/.voice_commands/Scripts/New_actions/.old
cp --backup=numbered ~/.voice_commands/Scripts/New_actions/"$string" ~/.voice_commands/Scripts/New_actions/.old
rm ~/.voice_commands/Scripts/New_actions/"$string"
line_num2=$(sed -n '/'"$string"'=/=' ~/.voice_commands/"v-c LANGS"/commands-"$TO" )
sed -i '/grep -x \"\$'"$string"'\"/,/##################################/d' ~/.voice_commands/speech_commands.sh
sed -i '/grep \"\$'"$string"'\"/,/##################################/d' ~/.voice_commands/speech_commands.sh
line_num=$(sed -n '/'"$string"'=/=' ~/.voice_commands/speech_commands.sh)
if [ -n "$line_num" ]; then
sed -i ''"$line_num"'d' ~/.voice_commands/speech_commands.sh
sed -i ''"$line_num"'i\
# Removed command: '"$string"', is refer to line '"$line_num2"', you have file on backup on: ./Scripts/New_actions/.old' ~/.voice_commands/speech_commands.sh
fi
cat ~/.voice_commands/Scripts/languages | while read line; do
lang=$(echo "$line" | cut -d ' ' -f1)
line_num=$(sed -n '/'"$string"'=/=' ~/.voice_commands/"v-c LANGS"/commands-"$lang" )
if [ -n "$line_num" ]; then
line_num1=$( echo "$line_num" + 1 | bc -l )
sed -i ''"$line_num"'i\
# Removed command: '"$string"', is refer to line '"$line_num2"', you have file on backup on: ./Scripts/New_actions/.old' ~/.voice_commands/"v-c LANGS"/commands-"$lang"
sed -i ''"$line_num1"'d' ~/.voice_commands/"v-c LANGS"/commands-"$lang"
fi
done
notify-send "# Removed command:" "$string"
exit 1
fi
fi


if ls -1  ~/.voice_commands/Scripts/New_actions/ | grep -q -v "$string"; then
	notify-send "Is no any new command: $string" "You can remove some action, created by yourself"
exit
fi

actions_new=$(echo `ls -1  ~/.voice_commands/Scripts/New_actions/`)
lines=$(echo "$actions_new" | tr '\n' ' ' | sed 's/ /\\\|/g' | sed 's/\\|*$//')

if selection=$(cat ~/.voice_commands/"v-c LANGS"/commands-"$TO" | grep ""$lines"=" |  zenity --list --width="750" --height="550" --column="Pick one" --title="Remove some command" --text="Which command do you want to remove ?");then
string=$( echo "$selection" | cut -d'=' -f1 )
orders=$( echo "$selection" | cut -d'=' -f2 )
if zenity --question --text="Do you want to remove: $string command ?";then
[ -d ~/.voice_commands/Scripts/New_actions/.old ] || mkdir ~/.voice_commands/Scripts/New_actions/.old
cp --backup=numbered ~/.voice_commands/Scripts/New_actions/"$string" ~/.voice_commands/Scripts/New_actions/.old
rm ~/.voice_commands/Scripts/New_actions/"$string"
sed -i '/grep -x \"\$'"$string"'\"/,/##################################/d' ~/.voice_commands/speech_commands.sh
sed -i '/grep \"\$'"$string"'\"/,/##################################/d' ~/.voice_commands/speech_commands.sh
line_num=$(sed -n '/'"$string"'=/=' ~/.voice_commands/speech_commands.sh)
if [ -n "$line_num" ]; then
sed -i ''"$line_num"'d' ~/.voice_commands/speech_commands.sh
sed -i ''"$line_num"'i\
# Removed command: '"$string"', is refer to line '"$line_num"', you have file backup on: ./Scripts/New_actions/.old' ~/.voice_commands/speech_commands.sh
fi
cat ~/.voice_commands/Scripts/languages | while read line; do
lang=$(echo "$line" | cut -d ' ' -f1)
line_num=$(sed -n '/'"$string"'=/=' ~/.voice_commands/"v-c LANGS"/commands-"$lang" )
if [ -n "$line_num" ]; then
line_num1=$( echo "$line_num" + 1 | bc -l )
sed -i ''"$line_num"'i\
# Removed command: '"$string"', is refer to line '"$line_num"', you have file backup on: ./Scripts/New_actions/.old' ~/.voice_commands/"v-c LANGS"/commands-"$lang"
sed -i ''"$line_num1"'d' ~/.voice_commands/"v-c LANGS"/commands-"$lang"
fi
done
notify-send "# Removed command:" "$string"
exit 1
fi
fi
exit 0
fi

