#!/bin/bash

# Written by Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart 
# GNU License. You are free to modify and redistribute   # 

lang="$1"
key="$2"
PKG_PATH=$(dirname "$(readlink -f "$0")")
SONGS_PATH="${PKG_PATH}"/sounds/ringtones
UTTERANCE=$(cat /tmp/speech_recognition.tmp | sed "s/  / /g" )

CMD_SELECT_FILE="select"
CMD_MUSIC_START="put music\|music play\|music player\|music\|pause"
CMD_MUSIC_START_SONG="put music of\|music of\|play to\|play music of"
CMD_MUSIC_PLAY="play music\|pause music\|start music\|stop music\|stop music"
CMD_MUSIC_NEXT="next song\|next track"
CMD_MUSIC_PREV="previous song\|previous track"
CMD_MUSIC_SHUFFLE="random music\|mix\|do not mix"
CMD_MUSIC_REPEAT="repeat\|not repeat"
CMD_VIDEO_REW="delay\|rewind\|go back"
CMD_VIDEO_FF="forward\|go forward"
CMD_VOLUME_DOWN="lower the volume\|volume down\|less volume\|volume less"
CMD_VOLUME_UP="increase the volume\|volume up\|more volume\|volume more"
CMD_VOLUME_MUTE="no audio\|no volume\|turn off audio\|dumb"
CMD_SEARCH="search"
CMD_NO_RESALT="remove highlighting\|remove highlighted\|no highlighting\|no highlighted"
CMD_TRANSLATE="translate\|translates the\|translation\|translates of\|translate from\|translated from\|translation from\|dictionary of the\|translates the\|translation of the"
CMD_WRITE="write\|type"
CMD_WRITE_CAPITAL="capitalize\|type capital"
CMD_WRITE_CAPITAL_ALL="write all uppercase\|write everything capitalized"
CMD_SAY_THIS="say this\|say"
CMD_GOOGLE_SEARCH="search google\|internet search\|meaning of\|what is\|search the dictionary"
CMD_YOUTUBE_SEARCH="search on youtube\|what about\|search videos\|videos\|search videos\|videos"
CMD_WIKI_SEARCH="search wiki\|search wikipedia\|wikipedia"
CMD_WEATHER="weather\|climate"
CMD_SEARCH_MAPS="map\|map search\|map of\|map from\|where is"
CMD_SAY_HI="greets to\|say hi to"
CMD_WHOAMI="who i am"
CMD_OPEN_FOLDER="open folder"
CMD_OPEN_FOLDER_OF="open folder of"
CMD_SAY_TIME="tell me the hour\|what the time is\|what time is it"
CMD_SAY_DATE="date is\|which day is\|that date today\|which day is today\|tell me the date\|on what date we are"
CMD_DICTATION="dictation mode\|out dictation mode\|end dictation mode"
CMD_MAIL="open mail\|open email\|open mail\|mail\|email"
CMD_COPY="copy"
CMD_PASTE="paste"
CMD_CUT="cut"
CMD_SELECT_ALL="select all"
CMD_SAVE="save\|save file"
CMD_SAVE_AS="save as\|save page as"
CMD_FOLDER="create folder\|new folder"
CMD_MINIMISE="minimize"
CMD_MAXIMISE="maximize"
CMD_FULLSCREEN="full screen\|fullscreen"
CMD_TAB="tabula\|tabular\|tab"
CMD_ESC="escape"
CMD_MENU="main menu\|open main menu"
CMD_ACTIONS_MENU="menu\|open menu\|close menu"
CMD_CLOSE="close program\|exit"
CMD_CLOSE_WIN="close window"
CMD_ZOOM_OUT="ward\|shrink\|decrease\|zoom less"
CMD_ZOOM_IN="approximate\|enlarge\|raise\|zoom more"
CMD_ZOOM_RESET="normal size\|zero zoom"
CMD_TOUCH_ON_OFF="turn off touchpad\|turn on touchpad\|touchpad"
CMD_BACK="over\|back"
CMD_ADVANCE="move\|forward"
CMD_RIGHT="right"
CMD_LEFT="left"
CMD_DOWN="down"
CMD_UP="go up"
CMD_PAGE_DOWN="page down"
CMD_PAGE_UP="page up"
CMD_SCROLL_DOWN="run page down\|run down"
CMD_SCROLL_UP="run page up\|run up"
CMD_DELETE="delete"
CMD_ENTER="open\|execute\|enter"
CMD_NEW_WINDOW="new window"
CMD_CHANGE_TAB="window move\|go to window\|switch to window\|window\|move tab\|go to tab\|switch to tab"
CMD_CLOSE_TAB="close tab"
CMD_BROWSER="browser\|open browser\|internet"
CMD_FILE_MANAGER="nautilus\|file explorer\|open nautilus\|open file explorer"
CMD_TERMINAL="open the console\|open terminal\|terminal opens\|open the terminal"
CMD_EXECUTE="launch command\|run command"
CMD_BATTERY="battery\|battery status\|battery charge"
CMD_TEXT_EDITOR="text editor\|open text editor\|launch text editor\|new text"
CMD_SCREENSHOT="screenshot\|catch"
CMD_ALARM="alarm\|start alarm at"
CMD_LOG_OFF="logout\|system logout"
CMD_BRIGHTNESS_UP="raise the brightness\|brighten up\|shine up\|up brightness\|increase brightness"
CMD_BRIGHTNESS_DOWN="lower the brightness\|brightness down\|shine down\|decrease brightness"
CMD_POWER_OFF="shut down the system\|turn off the machine\|turn off the computer\|turn off computer\|power off"
CMD_CALCULATER="calculator"
CMD_TAKE_PICTURE="photo\|take a picture"
CMD_OFFICE="open new document\|open new document of\|create new document\|create new document of\|create new\|open new"





###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SELECT_FILE" )
	if [ "$recog" != "" ]
	then
	file=$(echo "$UTTERANCE" | sed 's/'"$CMD_SELECT_FILE"' //g;s/'"$CMD_SELECT_FILE"'//')
xdotool type "$file"
rm /tmp/speech_recognition.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_START" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	rhythmbox-client --play-pause 
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_MUSIC_START_SONG" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	line=$(echo "$UTTERANCE" | sed 's/'"$CMD_MUSIC_START_SONG"' //g;s/'"$CMD_MUSIC_START_SONG"'//' )
	name=$(echo "$line")
	rhythmbox-client && sleep 1 && xdotool key "Ctrl+f" && xdotool type "$name" && rhythmbox-client --play && sleep 1 && rhythmbox-client --next
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_PLAY" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioPlay 
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_NEXT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioNext 
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_PREV" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioPrev 
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_SHUFFLE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioRandomPlay 
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_REPEAT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioRepeat
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VIDEO_REW" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86FrameBack
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VIDEO_FF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86FrameForward
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VOLUME_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioLowerVolume
	xdotool key XF86AudioLowerVolume
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VOLUME_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioRaiseVolume
	xdotool key XF86AudioRaiseVolume
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VOLUME_MUTE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioMute 
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1}' | grep -x "$CMD_SEARCH" )
	if [ "$recog" != "" ]
	then
	name=$(echo "$UTTERANCE" | sed 's/'"$CMD_SEARCH"' //g;s/'"$CMD_SEARCH"'//')
xdotool key "Ctrl+f" && xdotool type "`echo $name`"
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_NO_RESALT" )
	if [ "$recog" != "" ]
	then
xdotool key "Ctrl+Shift+k"
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -v "$CMD_WRITE_CAPITAL" | grep -v "$CMD_WRITE_CAPITAL_ALL" | awk '{print $1}' | grep -x "$CMD_WRITE")
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	line=$(echo "$UTTERANCE" | sed 's/'"$CMD_WRITE_CAPITAL"' //g;s/'"$CMD_WRITE_CAPITAL"'//' | sed 's/.*/\u&/' )

xdotool type "$line"
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_WRITE_CAPITAL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	line=$(echo "$UTTERANCE" | sed 's/'"$CMD_WRITE_CAPITAL"' //g;s/'"$CMD_WRITE_CAPITAL"'//' | sed 's/.*/\u&/' )

xdotool type "$line"
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_WRITE_CAPITAL_ALL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	line=$(echo "$UTTERANCE" | sed 's/'"$CMD_WRITE_CAPITAL_ALL"' //g;s/'"$CMD_WRITE_CAPITAL_ALL"'//' )

xdotool type "$line"
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_TRANSLATE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	FROM=$(echo "$UTTERANCE" | sed 's/'"$CMD_TRANSLATE"' //g;s/'"$CMD_TRANSLATE"'//' | awk '{print $1}')
	TO=$(echo "$UTTERANCE" | sed 's/'"$CMD_TRANSLATE"' //g;s/'"$CMD_TRANSLATE"'//' | sed 's/'"$FROM"' to the //' | sed 's/'"$FROM"' into//' | sed 's/'"$FROM"' to //' | sed 's/'"$FROM"' on //' | sed 's/'"$FROM"' to //' | awk '{print $1}')

	TEXT=$(echo "$UTTERANCE" | sed 's/'"$CMD_TRANSLATE"' //g;s/'"$CMD_TRANSLATE"'//' | sed 's/ '"$FROM"' to the '"$TO"' //' | sed 's/ '"$FROM"' into '"$TO"' //' | sed 's/ '"$FROM"' to '"$TO"' //' | sed 's/ '"$FROM"' on '"$TO"' //' | sed 's/ '"$FROM"' to '"$TO"' //')

echo "af afrikaans
ar arabic
az azerbaijani
be belarusian
bg bulgarian
bn bengali
ca catalan
cs czech
cy welsh
da danish
de german
el greek
en english
eo esperanto
es spanish
et estonian
eu basque
fa persian
fi finnish
fr french
ga irish
gl galician
gu gujarati
hi hindi
hr croatian
ht haitian
hu hungarian
hy armenian
id indonesian
is icelandic
it italian
iw hebrew
ja japanese
ka georgian
km khmer
kn kannada
ko korean
la latin
lo lao
lt lithuanian
lv latvian
mk macedonian
ms malay
mt maltese
nl dutch
no norwegian
pl polish
pt portuguese
ro romanian
ru russian
sk slovak
sl slovenian
sq albanian
sr serbian
sv swedish
sw swahili
ta tamil
te telugu
th thai
tl filipino
tr turkish
uk ukrainian
ur urdu
vi vietnamese
yi yiddish
zh-CN chinese" > /tmp/lang

if cat /tmp/lang | cut -d' ' -f2 | grep -x -q "$FROM"; then
	from=$( cat /tmp/lang  | grep "$FROM" | awk '{print $1}')
else
	from="$lang"
fi

if cat /tmp/lang | cut -d' ' -f2 | grep -x -q "$TO"; then
	to=$( cat /tmp/lang  | grep "$TO" | awk '{print $1}')
else
	to="es"
fi
echo "Translate to `cat /tmp/lang | grep  "$from " | cut -d' ' -f2` to `cat /tmp/lang | grep  "$to " | cut -d' ' -f2`: `echo "$TEXT" | sed 's/.*/\u&/' `"

	xdg-open "http://translate.google.com/?hl="$lang"#"$from"/"$to"/$(python -c "import urllib; print urllib.quote('''$TEXT''')")"
	rm /tmp/lang
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1, $2}' | grep -x "$CMD_SAY_THIS" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	the_text_encoded=$(echo "$UTTERANCE" | sed 's/'"$CMD_SAY_THIS"' //g;s/'"$CMD_SAY_THIS"'//')
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/say_this.mp3" "http://translate.google.com/translate_tts?tl=es&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/say_this.mp3
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_GOOGLE_SEARCH" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	SEARCH=$(echo "$UTTERANCE" | sed 's/'"$CMD_GOOGLE_SEARCH"' //g;s/'"$CMD_GOOGLE_SEARCH"'//')
	echo "$SEARCH"
	xdg-open "http://www.google.com/search?q=$(python -c "import urllib; print urllib.quote('''$SEARCH''')")" &
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1, $2, $3}'| grep "$CMD_YOUTUBE_SEARCH" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	SEARCH=$(echo "$UTTERANCE" | sed 's/'"$CMD_YOUTUBE_SEARCH"' //g;s/'"$CMD_YOUTUBE_SEARCH"'//')
	echo "$SEARCH"
	xdg-open "http://www.youtube.com/results?search_query=$(python -c "import urllib; print urllib.quote('''$SEARCH''')")" &
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_WIKI_SEARCH" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	SEARCH=$(echo "$UTTERANCE" | sed 's/'"$CMD_WIKI_SEARCH"' //g;s/'"$CMD_WIKI_SEARCH"'//')
	echo "$SEARCH"
	xdg-open "http://"$lang".wikipedia.org/w/index.php?search=$(python -c "import urllib; print urllib.quote('''$SEARCH''')")" &
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_WEATHER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	PLACE=$(echo "$UTTERANCE" | sed 's/'"$CMD_WEATHER"' //g;s/'"$CMD_WEATHER"'//')
	xdg-open "https://www.google.com/#q=weather+$(python -c "import urllib; print urllib.quote('''$PLACE''')")&hl="$lang"&safe=off" &
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_SEARCH_MAPS" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	PLACE=$(echo "$UTTERANCE" | sed 's/'"$CMD_SEARCH_MAPS"' //g;s/'"$CMD_SEARCH_MAPS"'//')

	xdg-open "https://maps.google.com/maps?hl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$PLACE''')")" &
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1, $2}' | grep "$CMD_SAY_HI" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	name=$(echo "$UTTERANCE" | sed 's/'"$CMD_SAY_HI"' //g;s/'"$CMD_SAY_HI"'//')
	the_text_encoded=$(echo "Hello "$name" Have a nice day!")
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/say_hi_to.mp3" "http://translate.google.com/translate_tts?tl=es&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/say_hi_to.mp3
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_WHOAMI" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	the_text_encoded=$(echo "Your name of user is `whoami`")
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/user-is-it.mp3" "http://translate.google.com/translate_tts?tl=es&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/user-is-it.mp3 
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_OPEN_FOLDER\|$CMD_OPEN_FOLDER_OF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
     command_line=$(echo "$recog" | sed 's/'"$CMD_OPEN_FOLDER"' //g;s/'"$CMD_OPEN_FOLDER_OF"' //' | awk '{print $1}' )

folder=$(find -maxdepth 1 -type d -print | sed 's|./||g' | grep -i "$command_line")
cd $HOME/"$folder"
directory=$(find -maxdepth 1 -type d -print | sed 's|./||g' | grep -i "$command_line" )
cd
sub_folder=$(echo "$UTTERANCE" | sed 's/'"$CMD_OPEN_FOLDER"' '"$command_line"' //g;s/'"$CMD_OPEN_FOLDER_OF"' '"$command_line"' //g' )

if [ -d $HOME/"$folder/$sub_folder" ]; then
nautilus $HOME/"$folder/$sub_folder"
rm /tmp/speech_recognition.tmp
exit 0;
fi
if [ -d $HOME/"$folder/$directory" ]; then
nautilus $HOME/"$folder/$directory"
rm /tmp/speech_recognition.tmp
exit 0;
fi
if echo "$UTTERANCE" | grep -x -i "$CMD_OPEN_FOLDER $command_line\|$CMD_OPEN_FOLDER_OF $command_line"; then
nautilus $HOME/"$folder"
rm /tmp/speech_recognition.tmp
exit 0;
fi

cd $HOME/"$folder"
sub_folder=$(find -maxdepth 1 -type d -print | sed 's|./||g' | grep -i "$directory" )
if [ -d $HOME/"$folder/$sub_folder" ]; then
nautilus $HOME/"$folder/$sub_folder"
rm /tmp/speech_recognition.tmp
exit 0;
fi

sub_folder=$(echo "$UTTERANCE" | sed 's/'"$CMD_OPEN_FOLDER"' '"$command_line"' //g;s/'"$CMD_OPEN_FOLDER_OF"' '"$command_line"' //g' )

[[ -d $HOME/"$folder/$sub_folder" ]] || echo `find $HOME/"$folder" -type d -name "*" -print | grep -i "$sub_folder" | grep -v -i "$sub_folder"/ ` | sed 's|'"$HOME"'|\n'"$HOME"'|g' | while read LINE
do
    if [ -d "$LINE" ]
    then
       nautilus "$LINE"
fi

done
rm /tmp/speech_recognition.tmp
exit 0;
fi
###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SAY_TIME" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
the_text_encoded=$(echo "Is: `date +%k` y `date +%M` minutes, with `date +%S` seconds")
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/time-is-it.mp3" "http://translate.google.com/translate_tts?tl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/time-is-it.mp3 
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SAY_DATE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
the_text_encoded=$(echo "Today is: `date +%A` `date +%d` of `date +%B` of `date +%Y`")
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/time-is-it.mp3" "http://translate.google.com/translate_tts?tl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/time-is-it.mp3 
rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_DICTATION" )
	if [ "$recog" != "" ]
	then
recognise()
{
process="$1"

if [ -f /tmp/dictation_mode/voice_"$process".flac ]; then

talk=`curl -s -X POST \
--data-binary @/tmp/dictation_mode/voice_"$process".flac \
--header 'Content-Type: audio/x-flac; rate=16000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&lang='$lang'&key='$key'' | cut -d\" -f8 `
JSON=$(echo "$talk" | sed '/^$/d' )

line=$(echo "$JSON" | tr '\n' ' ' | sed 's/  / /g' | sed 's/^[ ]*//' )
if echo "$line" | grep -v -q "Your client does not have permission to get URL" ; then
if [ -n "$line" ]; then
xdotool type "`echo "$line "`"
echo -e ""$line"\\r"
fi
fi
rm /tmp/dictation_mode/voice_"$process".flac  2>/dev/null
fi
}
record()
{
number_of_process=$(cat /tmp/dictation_mode/number_of_process)
let 'number_process = number_of_process + 1'
echo "$number_process" > /tmp/dictation_mode/number_of_process
if [ "$number_process" = 12 ]; then
echo "0" > /tmp/dictation_mode/number_of_process
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "Dicatation mode" "Recording ..."
fi
arecord -q -f cd -t wav -d 4 -r 16000 | flac - -f --best --sample-rate 16000 -o /tmp/dictation_mode/voice_.flac  2>/dev/null
PID=$(($RANDOM%8000+1000))

mv /tmp/dictation_mode/voice_.flac /tmp/dictation_mode/voice_"$PID".flac
recognise "$PID" &
record
}
if [ -f /tmp/dictation_mode/line_of_process ] ; then
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-off.png" "End of recording ..." 
script_process=$(cat /tmp/dictation_mode/line_of_process)
kill -HUP "$script_process"
rm -rf /tmp/dictation_mode
rm /tmp/speech_recognition.tmp
exit 1;
fi
mkdir /tmp/dictation_mode/
echo "$$" > /tmp/dictation_mode/line_of_process
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "Recording ..." 
echo "Result:"
echo "0" > /tmp/dictation_mode/number_of_process
record

	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_UNDO" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+z"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MAIL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch MailReader
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_COPY" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+c"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_PASTE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+v"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CUT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+x"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SELECT_ALL" )
	if [ "$recog" != "" ]
	then
	xdotool key "Ctrl+a"
rm /tmp/speech_recognition.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SAVE" )
	if [ "$recog" != "" ]
	then
	xdotool key "Ctrl+s"
rm /tmp/speech_recognition.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SAVE_AS" )
	if [ "$recog" != "" ]
	then
	xdotool key "Ctrl+Shift+s"
rm /tmp/speech_recognition.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_FOLDER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Shift+n"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MINIMISE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Alt+0"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MAXIMISE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Alt+5"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_FULLSCREEN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "F11"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TAB" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Tab"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ESC" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Escape"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MENU" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+F1"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ACTIONS_MENU" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "F10"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CLOSE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+q"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CLOSE_WIN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+w"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ZOOM_OUT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86ZoomOut"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ZOOM_IN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86ZoomIn"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TOUCH_ON_OFF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86TouchpadToggle"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################

recog=$(echo "$UTTERANCE" | grep -x "$CMD_ZOOM_RESET" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+0"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BACK" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+Left"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ADVANCE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+Right"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_RIGHT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Right"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_LEFT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Left"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Down"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Up"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_PAGE_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key KP_Page_Up
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SCROLL_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
win=`xdotool getactivewindow`

xdotool mousemove --window $win 45 110 

xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5
sleep 0.2
xdotool click --clearmodifiers 5

rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SCROLL_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
win=`xdotool getactivewindow`

xdotool mousemove --window $win 45 110 

xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4
sleep 0.2
xdotool click --clearmodifiers 4

rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_PAGE_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key KP_Page_Down
rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_DELETE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Delete"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ENTER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Enter"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_NEW_WINDOW" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+n"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_CHANGE_TAB" )
	if [ "$recog" != "" ]
	then
	winds=$(echo "$UTTERANCE" | sed 's/'"$CMD_CHANGE_TAB"' //g;s/'"$CMD_CHANGE_TAB"'//g;s/ //g;s/diez/010/g;s/once/011/g;s/doce/012/g;s/trece/013/g;s/catorce/014/g;s/quince/015/g;s/dieciséis/016/g;s/dieci/01/g;s/veinte/020/g;s/veinti/020/g;s/treintay/03/g;s/cuarentay/040/g;s/cincuentay/050/g;s/sesentay/060/g;s/setentay/070/g;s/ochentay/080/g;s/noventay/090/g;s/treintai/030/g;s/treinta/030/g;s/cuarentai/040/g;s/cuarenta/040/g;s/cincuentai/050/g;s/cincuenta/050/g;s/sesentai/060/g;s/sesenta/060/g;s/setentai/070/g;s/setenta/070/g;s/ochentai/080/g;s/ochenta/080/g;s/noventai/090/g;s/noventa/090/g;s/doscientos/200/g;s/trescientos/300/g;s/cuatrocientos/400/g;s/quinientos/500/g;s/seiscientos/600/g;s/setecientos/700/g;s/ochocientos/800/g;s/novecientos/900/g;s/ciento/100/g;s/cien/100/g;s/uno/01/g;s/un/01/g;s/dos/02/g;s/tres/03/g;s/cuatro/04/g;s/cinco/05/g;s/seis/06/g;s/siete/07/g;s/ocho/08/g;s/nueve/09/g;s/016/16/g;s/017/17/g;s/018/18/g;s/019/19/g;s/020/20/g;s/030/30/g;s/040/40/g;s/050/50/g;s/060/60/g;s/070/70/g;s/080/80/g;s/090/90/g;s/001/1/g;s/002/2/g;s/003/3/g;s/004/4/g;s/005/5/g;s/006/6/g;s/007/7/g;s/008/8/g;s/009/9/g' | sed 's/^[0]*//' )
	echo "number `echo $winds`"
	xdotool key Alt+`echo $winds`
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CLOSE_TAB" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+w"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BROWSER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch WebBrowser
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_FILE_MANAGER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch FileManager
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TERMINAL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch TerminalEmulator
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_EXECUTE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+F2"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BATTERY" )
	if [ "$recog" != "" ]
	then
	command=`acpi -b`

        if echo "$command" | grep -q "Full, 100%"; then
	message=$(echo "Full charge: 100%")
fi
        pcent=$(echo "$command" | cut -d' ' -f4 | cut -d',' -f1)
        rtime=$(echo "$command" | cut -d',' -f3 | cut -d' ' -f2)
	notify_time=$(echo "$rtime" | sed 's/:/ hours, /' | sed 's/:/ minutes, /')
        if echo "$command" | grep -q "Charging"; then
                message=$( echo "Charging: "$pcent"\n"$notify_time" seconds. Before completing charge")
            elif
		echo "$command" | grep -q "Discharging"; then
                message=$( echo "Discharged: "$pcent"\n"$notify_time" seconds remaining")
fi
        echo "$message"


wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/how-battery-is-it.mp3" "http://translate.google.com/translate_tts?tl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$message''')")&ie=UTF-8"
audacious /tmp/how-battery-is-it.mp3
    rm /tmp/how-battery-is-it.mp3
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TEXT_EDITOR" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	gedit
	rm /tmp/speech_recognition.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TAKE_PICTURE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	cheese
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1}' | grep -x "$CMD_ALARM" )
	if [ "$recog" != "" ]
	then
	number=$(echo "$UTTERANCE" | sed 's/'"$CMD_ALARM"' //g;s/'"$CMD_ALARM"'//g;s/ y/y/g;s/treinta y/030/g;s/cuarenta y/040/g;s/cincuenta y/050/g;s/sesenta y/060/g;s/setenta y/070/g;s/ochenta y/080/g;s/noventa y/090/g;s/diez/010/g;s/once/011/g;s/doce/012/g;s/trece/013/g;s/catorce/014/g;s/quince/015/g;s/dieciséis/016/g;s/dieci/01/g;s/veinte/020/g;s/veinti/020/g;s/treintai/030/g;s/treinta/030/g;s/cuarentai/040/g;s/cuarenta/040/g;s/cincuentai/050/g;s/cincuenta/050/g;s/sesentai/060/g;s/sesenta/060/g;s/setentai/070/g;s/setenta/070/g;s/ochentai/080/g;s/ochenta/080/g;s/noventai/090/g;s/noventa/090/g;s/doscientos/200/g;s/trescientos/300/g;s/cuatrocientos/400/g;s/quinientos/500/g;s/seiscientos/600/g;s/setecientos/700/g;s/ochocientos/800/g;s/novecientos/900/g;s/ciento/100/g;s/cien/100/g;s/uno/01/g;s/un/01/g;s/dos/02/g;s/tres/03/g;s/cuatro/04/g;s/cinco/05/g;s/seis/06/g;s/siete/07/g;s/ocho/08/g;s/nueve/09/g;s/016/16/g;s/017/17/g;s/018/18/g;s/019/19/g;s/020/20/g;s/030/30/g;s/040/40/g;s/050/50/g;s/060/60/g;s/070/70/g;s/080/80/g;s/090/90/g;s/001/1/g;s/002/2/g;s/003/3/g;s/004/4/g;s/005/5/g;s/006/6/g;s/007/7/g;s/008/8/g;s/009/9/g;s/ 0/ /g' )
	time="`echo $number | sed 's/^[0]*//'`"
	if echo "$time" | awk '{print $2}' | head -c 1 | grep -q "d"; then
	day="`echo "$time" | awk '{print $1}'` days"
	length_d="`echo "$time" | awk '{print $1}'`d "
fi
	if echo "$time" | awk '{print $2}' | head -c 1 | grep -q "h"; then
	hour="`echo "$time" | awk '{print $1}'` hours"
	length_h="`echo "$time" | awk '{print $1}'`h "
fi
	if echo "$time" | awk '{print $4}' | head -c 1 | grep -q "h"; then
	hour="`echo "$time" | awk '{print $3}'` hours"
	length_h="`echo "$time" | awk '{print $3}'`h "
fi
	if echo "$time" | awk '{print $2}' | head -c 1 | grep -q "m"; then
	min="`echo "$time" | awk '{print $1}'` minutes"
	length_m="`echo "$time" | awk '{print $1}'`m "
fi
	if echo "$time" | awk '{print $4}' | head -c 1 | grep -q "m"; then
	min="`echo "$time" | awk '{print $3}'` minutes"
	length_m="`echo "$time" | awk '{print $3}'`m "
fi
	if echo "$time" | awk '{print $6}' | head -c 1 | grep -q "m"; then
	min="`echo "$time" | awk '{print $5}'` minutes"
	length_m="`echo "$time" | awk '{print $5}'`m "
fi
	if echo "$time" | awk '{print $2}' | head -c 1 | grep -q "s"; then
	sec="`echo "$time" | awk '{print $1}'` seconds"
	length_s="`echo "$time" | awk '{print $1}'`s "
fi
	if echo "$time" | awk '{print $4}' | head -c 1 | grep -q "s"; then
	sec="`echo "$time" | awk '{print $3}'` seconds"
	length_s="`echo "$time" | awk '{print $3}'`s "
fi
	if echo "$time" | awk '{print $6}' | head -c 1 | grep -q "s"; then
	sec="`echo "$time" | awk '{print $5}'` seconds"
	length_s="`echo "$time" | awk '{print $5}'`s "
fi
	if echo "$time" | awk '{print $8}' | head -c 1 | grep -q "s"; then
	sec="`echo "$time" | awk '{print $7}'` seconds"
	length_s="`echo "$time" | awk '{print $7}'`s "
fi
	literal_alarm=$(echo ""$day" "$hour" "$min" "$sec"")
	alarm=$(echo ""$length_d""$length_h""$length_m""$length_s"")

if new_time=$( zenity --entry --entry-text="                                                     $alarm" --text="Alarm:$literal_alarm\n\n.You want to cancel or change with this\nsetting time?\nif you want to modify it, or cancel the process" | tr '[:upper:]' '[:lower:]' ); then
alarm=$(echo "$new_time" | sed 's/ //g;s/d/d /g;s/h/h /g;s/m/m /g;s/s/s /g' )
if echo "$new_time" | sed 's/ //g' | grep -x -o -q '\<[[:digit:][^dhms]*\>' ; then

	echo "Alarm:$alarm"
echo `date +%Y`-`date +%m`-`date +%d`:`date +%k`:`date +%M`:`date +%S` > /tmp/hora_actual
fecha=$(cat /tmp/hora_actual)

uno()
{
echo "Alarm:$alarm"
#pic_ring=$(echo "`ls "${SONGS_PATH}"/* | sed 's|'"${SONGS_PATH}"'/||g'`" | zenity --list --title="Pick a Rign tone" --width="335" --height="310" --column="Pick a file" )

#if [ -f "${SONGS_PATH}"/"$pic_ring" ]; then
#	sleep $alarm && audacious "${SONGS_PATH}"/"$pic_ring"
#	rm /tmp/speech_recognition.tmp
#exit 1
#fi
sleep $alarm && audacious ""${SONGS_PATH}"/vip ringtone.mp3"
	rm /tmp/speech_recognition.tmp
exit 0;
}

dos()
{
text_in=$(zenity --title "Text reminder" --width="335" --height="310" --text-info --editable | awk '{ printf "%s ", $0 }')
echo "$text_in" > /tmp/Texto_recordatorio-temp
mv /tmp/Texto_recordatorio-temp ~/".$fecha.Alarm sleeping by: $alarm.txt"

sleep $alarm
if (zenity --title "Text reminder" --width="335" --height="310" --text-info --checkbox "Check the box to save the text." --filename="$HOME/.$fecha.Alarm sleeping by: $alarm.txt")
then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/"$fecha.Alarm sleeping by: $alarm.txt"
DESTINO=$(zenity --file-selection --filename="$HOME/$fecha.Alarm sleeping by: $alarm.txt" --save)
mv "$HOME/$fecha.Alarm sleeping by: $alarm.txt" "$DESTINO"
exit 0;
fi
}

tres()
{
echo "Alarm:$alarm"
	sleep $alarm && rhythmbox-client --play
}

cuatro()
{
echo "Alarm:$alarm"
rec -r 16000 -c 1 -t mp3  ~/".$fecha record-reminder Sleeping:$alarm.mp3" 2>&1 | awk -vRS="\r" '$1 ~ /In/ {gsub(/In:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $3"\n# Record reminder.\\n\\nClose this window to\\nend recording.\\n\\nTime:\\t"$2"\\nSize :\\t"$4; fflush();}' | zenity --window-icon="/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" --progress --pulsate --no-cancel --auto-kill --auto-close --width="255" --height="190" --title=" Recording ..."
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" " Recording ..." 
	sleep $alarm && audacious ~/".$fecha record-reminder Sleeping:$alarm.mp3"
}

cinco()
{
echo "Alarm:$alarm"
text_in=$(zenity --title "Text reminder" --width="335" --height="310" --text-info --editable | awk '{ printf "%s ", $0 }')
echo "$text_in" > /tmp/Texto_recordatorio-temp
mv /tmp/Texto_recordatorio-temp ~/".$fecha.Alarm sleeping by: $alarm.txt"
sleep $alarm && audacious ""${PKG_PATH}"/vip ringtone.mp3"
if (zenity --title "Text reminder" --width="335" --height="310" --text-info --checkbox "Check the box to save the text." --filename="$HOME/.$fecha.Alarm sleeping by: $alarm.txt")
then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/"$fecha.Alarm sleeping by: $alarm.txt"
DESTINO=$(zenity --file-selection --filename="$HOME/$fecha.Alarm sleeping by: $alarm.txt" --save)
mv "$HOME/$fecha.Alarm sleeping by: $alarm.txt" "$DESTINO"
exit 0;
fi
if [ -f ~/".$fecha.Alarm sleeping by: $alarm.txt" ]; then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/Esritorio

fi
}

seis()
{
echo "Alarm:$alarm"
text_in=$(zenity --title "Text reminder" --width="335" --height="310" --text-info --editable | awk '{ printf "%s ", $0 }')
echo "$text_in" > /tmp/Texto_recordatorio-temp
mv /tmp/Texto_recordatorio-temp ~/".$fecha.Alarm sleeping by: $alarm.txt"
sleep $alarm && rhythmbox-client --play
if (zenity --title "Text reminder" --width="335" --height="310" --text-info --checkbox "Check the box to save the text." --filename="$HOME/.$fecha.Alarm sleeping by: $alarm.txt")
then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/"$fecha.Alarm sleeping by: $alarm.txt"
DESTINO=$(zenity --file-selection --filename="$HOME/$fecha.Alarm sleeping by: $alarm.txt" --save)
mv "$HOME/$fecha.Alarm sleeping by: $alarm.txt" "$DESTINO"
exit 0;
fi
if [ -f ~/".$fecha.Alarm sleeping by: $alarm.txt" ]; then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/Esritorio

fi
}
siete()
{
echo "Alarm:$alarm"
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" " Recording ..." 
rec -r 16000 -c 1 -t flac  /tmp/grabacion-recordatorio.flac 2>&1 | awk -vRS="\r" '$1 ~ /In/ {gsub(/In:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $3"\n# Record reminder.\\n\\nClose this window to\\nend recording.\\n\\nTiempo:\\t"$2"\\nTamaño :\\t"$4; fflush();}' | zenity --window-icon="/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" --progress --pulsate --no-cancel --auto-kill --auto-close --width="255" --height="190" --title=" Recording ..." 

JSON=`curl -s -X POST \
--data-binary @'/tmp/grabacion-recordatorio.flac' \
--header 'Content-Type: audio/x-flac; rate=16000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&lang='$lang'&key='$key'' | cut -d\" -f8 `
mv /tmp/grabacion-recordatorio.flac ~/".$fecha record-reminder Sleeping:$alarm.flac"
echo "$JSON" | sed '/^$/d' > /tmp/Texto_recordatorio-temp

text_in=$(zenity --title "Text reminder" --width="335" --height="310" --text-info --editable --filename="/tmp/Texto_recordatorio-temp" | awk '{ printf "%s ", $0 }')
echo "$text_in" > /tmp/Texto_recordatorio-temp
mv /tmp/Texto_recordatorio-temp ~/".$fecha.Alarm sleeping by: $alarm.txt"
sleep $alarm
mv ~/".$fecha record-reminder Sleeping:$alarm.flac" ~/"$fecha record-reminder Sleeping:$alarm.flac"
audacious ~/"$fecha record-reminder Sleeping:$alarm.flac" &
if (zenity --title "Text reminder" --width="335" --height="310" --text-info --checkbox "Check the box to save the text." --filename="$HOME/.$fecha.Alarm sleeping by: $alarm.txt")
then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/"$fecha.Alarm sleeping by: $alarm.txt"
DESTINO=$(zenity --file-selection --filename="$HOME/$fecha.Alarm sleeping by: $alarm.txt" --save)
mv "$HOME/$fecha.Alarm sleeping by: $alarm.txt" "$DESTINO"
exit 0;
fi
if [ -f ~/".$fecha.Alarm sleeping by: $alarm.txt" ]; then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/Esritorio

fi
}

dialogo()
{
	opcion=$( zenity --list --text="Opciones of alarmas" --radiolist --width="330" --height="285" --title="Alarms"  \
					--column='Clic' --column='Opción'  \
					'TRUE' 		"Alarm_(A_sound)"  \
					'FALSE' 		"Alarm_(A_text)"  \
					'FALSE' 		"Alarm_(Play_Music)"  \
					'FALSE' 		"Alarm_(A_record)"  \
					'FALSE' 		"Alarm_(A_sound+text)"  \
					'FALSE' 		"Alarm_(Play_Music+text)"  \
					'FALSE' 		"Alarm_(A_record+text)"  )

}

comando()
{
dialogo

	if [ ${opcion} = 'Alarm_(A_sound)' ]; then
		uno
	elif [ ${opcion} = 'Alarm_(A_text)' ]; then
		dos
	elif [ ${opcion} = 'Alarm_(Play_Music)' ]; then
		tres
	elif [ ${opcion} = 'Alarm_(A_record)' ]; then
		cuatro
	elif [ ${opcion} = 'Alarm_(A_sound+text)' ]; then
		cinco
	elif [ ${opcion} = 'Alarm_(Play_Music+text)' ]; then
		seis
	elif [ ${opcion} = 'Alarm_(A_record+text)' ]; then
		siete
	else
		echo "Error in selection."
		exit 1
	fi
}
comando
rm /tmp/speech_recognition.tmp
exit 0;
fi
fi
	notify-send "Command, Alaram is:" "sleep ( 0 - 9 ) d ( 0 - 9 ) h ( 0 - 9 ) m ( 0 - 9 ) s 
Alaram off"
	rm /tmp/speech_recognition.tmp
exit 1;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_LOG_OFF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Alt+BackSpace"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BRIGHTNESS_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86MonBrightnessUp"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BRIGHTNESS_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86MonBrightnessDown"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_POWER_OFF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86PowerOff"
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CALCULATER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	gcalctool
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SCREENSHOT" )
	if [ "$recog" != "" ]
	then
	echo "Screenshot of `date +%Y`-`date +%m`-`date +%d`:`date +%k`:`date +%M`:`date +%S`.png" > /tmp/date-to-pict.temp
	DATE_PIC=$(cat /tmp/date-to-pict.temp)
	import -window root ~/Imágenes/"$DATE_PIC"
	eog ~/Imágenes/"$DATE_PIC"
	rm /tmp/date-to-pict.temp
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_OFFICE" )
	if [ "$recog" != "" ]
	then
	docs=$(echo "$UTTERANCE" | sed 's/'"$CMD_OFFICE"' //g;s/'"$CMD_OFFICE"'//')

Action_Writer=$(echo "$UTTERANCE" | grep "text" )
	if [ "$Action_Writer" != "" ]
	then
libreoffice --writer
	rm /tmp/speech_recognition.tmp
exit 0;
fi
Action_Calc=$(echo "$UTTERANCE" | grep "calc" )
	if [ "$Action_Calc" != "" ]
	then
libreoffice --calc
	rm /tmp/speech_recognition.tmp
exit 0;
fi
Action_Impress=$(echo "$UTTERANCE" | grep "presentation\|page\|web" )
	if [ "$Action_Impress" != "" ]
	then
libreoffice --impress
	rm /tmp/speech_recognition.tmp
exit 0;
fi
Action_Draw=$(echo "$UTTERANCE" | grep "drawing\|graphic" )
	if [ "$Action_Draw" != "" ]
	then
libreoffice --draw
	rm /tmp/speech_recognition.tmp
exit 0;
fi
Action_Math=$(echo "$UTTERANCE" | grep "formula\|math" )
	if [ "$Action_Math" != "" ]
	then
libreoffice --math
	rm /tmp/speech_recognition.tmp
exit 0;
fi
	rm /tmp/speech_recognition.tmp
exit 0;
fi

###################################################################

if [ -f /tmp/speech_recognition.tmp ]; then
rm /tmp/speech_recognition.tmp
fi
	if [ "$?" -eq 0 ]; then
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-off.png" "There is no command:" "$UTTERANCE"

exit 1
fi
