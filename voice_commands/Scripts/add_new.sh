#!/bin/bash

# Written by Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart 
# GNU License. You are free to modify and redistribute   # 
lang="en"
[ -d ~/.voice_commands/Scripts/New_actions ] || mkdir ~/.voice_commands/Scripts/New_actions/
text_line=$(echo "ACTION_NAME=this is one way to say it\\|this is another way")
	if [ -n "$1" ]; then
text_line=$(echo ""$@"=" | sed 's/  / /g;s/ /_/g' | tr '[:lower:]' '[:upper:]')
if echo "$@" | grep "="
	then
cmd_name=$( echo "$@" | sed 's/^[ ]*//' | sed 's/  / /g;s/ =/=/g' | cut -d'=' -f1 | sed 's/^[ ]*//'  )
orders=$( echo "$@" | sed 's/  / /g;s/= /=/g' | cut -d'=' -f2 | sed 's/;/\\|/g;s/ \\|/\\|/g;s/\\| /\\|/g;s/= /=/g;s/'"'"'/ /g;s/\"//g' | tr '[:upper:]' '[:lower:]' | sed 's/^[ ]*//' | sed 's/^[\\|]*//' | sed 's/^[ ]*//' | sed 's/^[\\|]*//' | sed 's/\\|*$//' | sed 's/ *$//' | sed 's/\\|*$//' | sed 's/ *$//' )
text_line=$(echo ""$cmd_name"="$orders"")
	fi
fi

new_cmd()
{
if option=$( zenity --entry --entry-text="$text_line" --text="Entry the NAME of the \"\$SRTING\" and the call method, after =. Separe the options by \\\| or ;\nThen press \"Create\" to edit your script, which will be exec uted. Or to \"Cancel\" for exit" --title="New command configuration" --width="650" --height="50" --ok-label="Create" --cancel-label="Cancel"); then
cmd_name=$( echo "$option" | sed 's/^[ ]*//' | sed 's/  / /g;s/ =/=/g' | cut -d'=' -f1 | sed 's/^[ ]*//'  )
string=$( echo "CMD_"$cmd_name"" | tr '[:lower:]' '[:upper:]' | sed 's/ /_/g;s/'"'"'//g;s/\"//g' )
orders=$( echo "$option" | sed 's/  / /g;s/= /=/g' | cut -d'=' -f2 | sed 's/;/\\|/g;s/ \\|/\\|/g;s/\\| /\\|/g;s/= /=/g;s/'"'"'/ /g;s/\"//g' | tr '[:upper:]' '[:lower:]' | sed 's/^[ ]*//' | sed 's/^[\\|]*//' | sed 's/^[ ]*//' | sed 's/^[\\|]*//' | sed 's/\\|*$//' | sed 's/ *$//' | sed 's/\\|*$//' | sed 's/ *$//' )
else
exit
fi
}
new_cmd

if [ -z "$option" ]; then
zenity --warning --text="The operation was canceled."
	exit 1
fi

if echo "$option" | grep -q -v "="; then
zenity --warning --text="The command line most have \"=\", symbol. Before the\n command call method, after the action name\n Try again, follow this indications."
text_line=$(echo ""$cmd_name"="$orders"")
	new_cmd
fi

if [ -z "$string" ]; then
zenity --warning --text="The command line most have \"=\", symbol. After the action name\n Try again, follow this indications."
text_line=$(echo ""$cmd_name"="$orders"")
	new_cmd
fi

if [ -z "$orders" ]; then
zenity --warning --text="The command line most have \"=\", symbol. Before the\n command call method, after the action name\n Try again, follow this indications."
text_line=$(echo ""$cmd_name"="$orders"")
	new_cmd
fi

	if cut -d'=' -f1 ~/.voice_commands/"v-c LANGS"/commands-"$lang"  | grep -q -x "$string"; then
zenity --warning --text="The action name: $cmd_name\nhave been already used\nSelect another name.\n Try again, follow this indications."
	text_line=$(echo ""$cmd_name"="$orders"")
	new_cmd
fi

	cmd_line=$( cut -d'=' -f2 ~/.voice_commands/"v-c LANGS"/commands-"$lang" )
	if echo "$cmd_line" | grep -q -x "$orders"; then
zenity --warning --text="The sentence call method: `echo "$cmd_line" | grep -x "$orders"` have been already used\nYou only have to change some word.\n Try again, follow this indications."
	text_line=$(echo ""$cmd_name"="$orders"")
	new_cmd
fi
echo "#!/bin/sh
"$string"()
{
echo "'"'""'"'"
}
command_test=\$(echo "'"'"TEST"'"'")
	if [ \${command_test} = 'TEST' ]; then
		"$string"
	else
		echo "'"'"Rong characters"'"'"
	exit 1
	fi" > /tmp/script_test
if sh /tmp/script_test  2>&1 | grep "Syntax error: Bad function name" ; then
zenity --warning --text="The action name have illegal characters\nName: "$string"\nError output: \n \"Syntax error: Bad function name\"\n\nTry again whit Alfa numeric symbols [A-Z/0-9] "
	exit 1
fi

lines_num=$(wc -l ~/.voice_commands/speech_commands.sh | cut -d' ' -f 1)
line_paste=$( echo $lines_num - 8 | bc -l )
lines_num_cmd=$(wc -l ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d' ' -f 1)
line_paste_cmd=$( echo $lines_num_cmd + 1 | bc -l )
echo "#!/bin/bash
# File: ~/.voice_commands/Scripts/New_actions/$string
# Write here the command line, which will be call as: "'"'""$orders""'"'"
# The program will, run "'"'""$string""'"'", at the file, speech_commands.sh
# You can change, bash for your source code. And will be better remove all of this unnecessary lines.
# The complete order by default, it is in the input, from the exec is : language "'"'""\$1""'"'", and all sentence "'"'""\$@""'"'". You maybe can use it.
# Should remove it the # , previous the command line.
# In this command lines:
#
# lang="'"'"\$1"'"'"
# $string=\$(sed -n '"$line_paste_cmd"p' ~/.voice_commands/"'"'"v-c LANGS"'"'"/commands-"'"'"\$lang"'"'" | cut -d "'"'"="'"'" -f 2)
# UTTERANCE=\$(echo "'"'"\$@"'"'" | sed 's/'"'"'"\$lang"'"'"' //' )
# the_rest=\$(echo "'"'"\$UTTERANCE"'"'" | sed 's/'"'"'"\$"$string""'"'"'//' )" > ~/.voice_commands/Scripts/New_actions/"$string"
chmod +x ~/.voice_commands/Scripts/New_actions/"$string"
sed -i ''"$line_paste"'i\
\n\nrecog=\$(echo \"\$UTTERANCE\" | grep \"\$'"$string"'\" )\n\tif \[ \"\$recog\" != \"\" \]\n\tthen\n\tnotify-send \"Command:\"  \"\$recog\"\nexec ~/.voice_commands/Scripts/New_actions/'"$string"' \"\$lang\" \$UTTERANCE\" \&\n\tmv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp\nexit 0;\nfi\n\n###################################################################' ~/.voice_commands/speech_commands.sh

sed -i '125i\
'"$string"'=\$(sed -n '"'"''"$line_paste_cmd"'p'"'"' ~/.voice_commands/\ "v-c LANGS\"/commands-\"\$lang\" | cut -d \"=\" -f 2)' ~/.voice_commands/speech_commands.sh
cat ~/.voice_commands/Scripts/languages | while read line; do
TO=$(echo "$line" | awk '{ print $1 }')
echo ""$string"="$orders"" >> ~/.voice_commands/"v-c LANGS"/commands-"$TO"; done
v-c -u
gedit ~/.voice_commands/Scripts/New_actions/"$string"
notify-send "You have created the new command:" "$string"
if zenity --question --text="Do you want to translate to the others languages, your new command ?";then

awk '{printf("%0d;" ,(NR)); print $0 }' ~/.voice_commands/Scripts/languages | while read line; do
TO=$(echo "$line" | awk '{ print $1 }' | cut -d';' -f2)
langs=$(echo "$line" | cut -d' ' -f2 | sed 's/.*/\u&/')
num=$(echo "$line" | cut -d';' -f1)
percent=$(echo $num \* 1.51 | bc -l)

echo "$orders" | sed 's/\\|/;/g' | tr ';' '\n' | while read line; do the_text_encoded=$(echo $line); translate=$(curl -s -A "Mozilla/5.0" "http://translate.google.com/translate_a/t?client=t&text=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&hl=$lang&sl=ese&tl=$TO&ie=UTF-9&oe=UTF-9&multires=1&prev=btn&ssel=0&tsel=0&sc=1" | sed 's/\[\[\["\([^"]*\).*/\1/'| sed 's/  / /g' | sed 's/'"'"'/ /g'| tail -n 1 | tr '[:upper:]' '[:lower:]' );

sed -i 's/|'"$the_text_encoded"'/|'"$translate"'/g;s/='"$the_text_encoded"'/='"$translate"'/g;s/'"$the_text_encoded"'\\/'"$translate"'\\/g' ~/.voice_commands/"v-c LANGS"/commands-"$TO"
echo -n "Percent: "$percent"%        Language: "$langs"          "\\r
done
done
echo "Percent: 100%        Language: Chinese-T          "
rm /tmp/script_test
if [ -f ~/.voice_commands/Scripts/New_actions/"$string"~ ]; then
rm ~/.voice_commands/Scripts/New_actions/"$string"~
fi
exit 0
	else
	rm /tmp/script_test
if [ -f ~/.voice_commands/Scripts/New_actions/"$string"~ ]; then
rm ~/.voice_commands/Scripts/New_actions/"$string"~
fi
exit
fi
