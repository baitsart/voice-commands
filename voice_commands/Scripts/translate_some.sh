#!/bin/bash
TO="en"
if selection=$(cat ~/.voice_commands/"v-c LANGS"/commands-"$TO" |  zenity --list --width="750" --height="550" --column="Pick one" --title="Translate some command" --text="Which command do you want to translate ?");then

string=$( echo "$selection" | cut -d'=' -f1 )
orders=$( echo "$selection" | cut -d'=' -f2 )
sh ~/.voice_commands/Scripts/translator.sh ""$string"="$orders"" 2>&1  | awk -vRS="\r" '$1 ~ /Percent:/ {gsub(/Percent:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $1"\n# Process of translation.\\n\\n"$2": \\t\\t"$3"\\n\\nPercentage:\\t"$1; fflush();}' | zenity --progress --auto-close --no-cancel --ok-label="Quit" --width="270" --height="130" --title=" Progress..." 
exit 1
else
exit
fi
