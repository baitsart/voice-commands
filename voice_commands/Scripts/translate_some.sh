#!/bin/bash
web_host=$(echo `ping -c 1 www.google.com`)
if [ -z "$web_host" ] ; then
	notify-send "Internet connection required"
exit
fi
[ -d ~/.voice_commands/Scripts/New_actions ] || mkdir ~/.voice_commands/Scripts/New_actions/
actions_new=$(echo `ls -1  ~/.voice_commands/Scripts/New_actions/`)
if [ -z "$actions_new" ] ; then
	notify-send "Create some action, first" "You didn't create any new action, to be translate"
exit
fi
TO="en"
lines=$(echo "$actions_new" | tr '\n' ' ' | sed 's/ /\\\|/g' | sed 's/\\|*$//')
if selection=$(cat ~/.voice_commands/"v-c LANGS"/commands-"$TO" | grep ""$lines"=" |  zenity --list --width="750" --height="550" --column="Pick one" --title="Translate some command" --text="Which command do you want to translate ?");then

string=$( echo "$selection" | cut -d'=' -f1 )
orders=$( echo "$selection" | cut -d'=' -f2 )
sh ~/.voice_commands/Scripts/translator.sh ""$string"="$orders"" 2>&1  | awk -vRS="\r" '$1 ~ /Percent:/ {gsub(/Percent:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $1"\n# Process of translation.\\n\\n"$2": \\t\\t"$3"\\n\\nPercentage:\\t"$1; fflush();}' | zenity --progress --auto-close --no-cancel --ok-label="Quit" --width="270" --height="130" --title=" Progress..." 
exit 1
else
exit
fi
