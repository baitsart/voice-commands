#!/bin/bash

# Written by Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart 
# GNU License. You are free to modify and redistribute   # 

lang="$1"
key="$2"
recording=3
microphe_port=$(sed -n '1p' ~/.voice_commands/"v-c LANGS"/Scripts/microphone_port | cut -d '=' -f2)
input=$(sed -n '1p' ~/.voice_commands/"v-c LANGS"/Scripts/input_port | cut -d '=' -f2)
SONGS_PATH="$HOME/.voice_commands/sounds/ringtones"
UTTERANCE=$(cat /tmp/speech_recognition.tmp | sed "s/  / /g" )

CMD_SELECT_FILE=$(sed -n '1p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MUSIC_START=$(sed -n '2p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MUSIC_START_SONG=$(sed -n '3p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MUSIC_PLAY=$(sed -n '4p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MUSIC_NEXT=$(sed -n '5p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MUSIC_PREV=$(sed -n '6p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MUSIC_SHUFFLE=$(sed -n '7p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MUSIC_REPEAT=$(sed -n '8p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MEDIA_REW=$(sed -n '9p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MEDIA_FF=$(sed -n '10p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_VOLUME_DOWN=$(sed -n '11p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_VOLUME_UP=$(sed -n '12p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_VOLUME_MUTE=$(sed -n '13p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SEARCH=$(sed -n '14p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_NO_STAND_OUT=$(sed -n '15p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_TRANSLATE=$(sed -n '16p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_WRITE=$(sed -n '17p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_WRITE_CAPITAL=$(sed -n '18p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_WRITE_CAPITAL_ALL=$(sed -n '19p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SAY_THIS=$(sed -n '20p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_GOOGLE_SEARCH=$(sed -n '21p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_YOUTUBE_SEARCH=$(sed -n '22p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_WIKI_SEARCH=$(sed -n '23p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_WEATHER=$(sed -n '24p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SEARCH_MAPS=$(sed -n '25p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SAY_HI=$(sed -n '26p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_HELLO=$(sed -n '27p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_WHOAMI=$(sed -n '28p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_OPEN_FOLDER=$(sed -n '29p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_OPEN_FOLDER_OF=$(sed -n '30p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SAY_TIME=$(sed -n '31p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SAY_DATE=$(sed -n '32p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_DICTATION=$(sed -n '33p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_UNDO=$(sed -n '34p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_REDO=$(sed -n '35p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_DEL_LINE=$(sed -n '36p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_FAV=$(sed -n '37p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_CLOSE_TERM=$(sed -n '38p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MAIL=$(sed -n '39p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_COPY=$(sed -n '40p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_PASTE=$(sed -n '41p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_CUT=$(sed -n '42p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SELECT_ALL=$(sed -n '43p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SAVE=$(sed -n '44p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SAVE_AS=$(sed -n '45p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_FOLDER=$(sed -n '46p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MINIMISE=$(sed -n '47p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MAXIMISE=$(sed -n '48p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_FULLSCREEN=$(sed -n '49p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_TAB=$(sed -n '50p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ESC=$(sed -n '51p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_MENU=$(sed -n '52p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ACTIONS_MENU=$(sed -n '53p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_CLOSE=$(sed -n '54p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_CLOSE_WIN=$(sed -n '55p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ZOOM_OUT=$(sed -n '56p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ZOOM_IN=$(sed -n '57p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ZOOM_RESET=$(sed -n '58p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_TOUCH_ON_OFF=$(sed -n '59p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_BACK=$(sed -n '60p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ADVANCE=$(sed -n '61p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_RIGHT=$(sed -n '62p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_LEFT=$(sed -n '63p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_DOWN=$(sed -n '64p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_UP=$(sed -n '65p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_PAGE_DOWN=$(sed -n '66p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_PAGE_UP=$(sed -n '67p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_HOME_PAGE=$(sed -n '68p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_END_PAGE=$(sed -n '69p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_HOME=$(sed -n '70p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_END=$(sed -n '71p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SCROLL_DOWN=$(sed -n '72p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SCROLL_UP=$(sed -n '73p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_DELETE=$(sed -n '74p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ENTER=$(sed -n '75p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_NEW_WINDOW=$(sed -n '76p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_CHANGE_TAB=$(sed -n '77p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_CLOSE_TAB=$(sed -n '78p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_BROWSER=$(sed -n '79p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_FILE_MANAGER=$(sed -n '80p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_TERMINAL=$(sed -n '81p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_EXECUTE=$(sed -n '82p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_BATTERY=$(sed -n '83p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_TEXT_EDITOR=$(sed -n '84p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_SCREENSHOT=$(sed -n '85p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_ALARM=$(sed -n '86p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_LOG_OFF=$(sed -n '87p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_BRIGHTNESS_UP=$(sed -n '88p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_BRIGHTNESS_DOWN=$(sed -n '89p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_POWER_OFF=$(sed -n '90p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_CALCULATOR=$(sed -n '91p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_TAKE_PICTURE=$(sed -n '92p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_TAKE_VIDEO=$(sed -n '93p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_OPEN_FILE=$(sed -n '94p' /usr/bin/voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
CMD_OFFICE=$(sed -n '95p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
Writer=$(sed -n '96p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
Calc=$(sed -n '97p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
Impress=$(sed -n '98p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
Draw=$(sed -n '99p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
Math=$(sed -n '100p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
# CMD_RETRY ' It is in /usr/bin/voice_commands/play_stop.sh, and is refer to line 101 '





###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SELECT_FILE" )
	if [ "$recog" != "" ]
	then
	file=$(echo "$UTTERANCE" | sed 's/'"$CMD_SELECT_FILE"' //g;s/'"$CMD_SELECT_FILE"'//')
xdotool type "$file"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_START" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	rhythmbox-client --play-pause 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_PLAY" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioPlay 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_NEXT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioNext 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_PREV" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioPrev 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_SHUFFLE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioRandomPlay 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MUSIC_REPEAT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioRepeat
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MEDIA_REW" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86FrameBack
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MEDIA_FF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86FrameForward
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VOLUME_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioLowerVolume
	xdotool key XF86AudioLowerVolume
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VOLUME_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioRaiseVolume
	xdotool key XF86AudioRaiseVolume
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_VOLUME_MUTE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key XF86AudioMute 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_NO_STAND_OUT" )
	if [ "$recog" != "" ]
	then
xdotool key "Ctrl+Shift+k"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -v "$CMD_WRITE_CAPITAL" | grep -v "$CMD_WRITE_CAPITAL_ALL" | awk '{print $1}' | grep -x "$CMD_WRITE")
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	line=$(echo "$UTTERANCE" | sed 's/'"$CMD_WRITE"' //g;s/'"$CMD_WRITE"'//' )

xdotool type "$line"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_WRITE_CAPITAL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	line=$(echo "$UTTERANCE" | sed 's/'"$CMD_WRITE_CAPITAL"' //g;s/'"$CMD_WRITE_CAPITAL"'//' | sed 's/.*/\u&/' )

xdotool type "$line"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_WRITE_CAPITAL_ALL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	line=$(echo "$UTTERANCE" | sed 's/'"$CMD_WRITE_CAPITAL_ALL"' //g;s/'"$CMD_WRITE_CAPITAL_ALL"'//' )

xdotool type "$line"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
echo "Translate to `cat /tmp/lang | grep  "$from " | cut -d' ' -f2` to `cat /tmp/lang | grep  "$to " | cut -d' ' -f2`: `echo "$TEXT" `"

	xdg-open "http://translate.google.com/?hl="$lang"#"$from"/"$to"/$(python -c "import urllib; print urllib.quote('''$TEXT''')")"
	rm /tmp/lang
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1, $2}' | grep -x "$CMD_SAY_THIS" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	the_text_encoded=$(echo "$UTTERANCE" | sed 's/'"$CMD_SAY_THIS"' //g;s/'"$CMD_SAY_THIS"'//')
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/say_this.mp3" "http://translate.google.com/translate_tts?tl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/say_this.mp3
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_WEATHER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	PLACE=$(echo "$UTTERANCE" | sed 's/'"$CMD_WEATHER"' //g;s/'"$CMD_WEATHER"'//')
	xdg-open "https://www.google.com/#q=weather+$(python -c "import urllib; print urllib.quote('''$PLACE''')")&hl="$lang"&safe=off" &
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_SEARCH_MAPS" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	PLACE=$(echo "$UTTERANCE" | sed 's/'"$CMD_SEARCH_MAPS"' //g;s/'"$CMD_SEARCH_MAPS"'//')

	xdg-open "https://maps.google.com/maps?hl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$PLACE''')")" &
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1}' | grep -x "$CMD_SEARCH" )
	if [ "$recog" != "" ]
	then
	name=$(echo "$UTTERANCE" | sed 's/'"$CMD_SEARCH"' //g;s/'"$CMD_SEARCH"'//')
xdotool key "Ctrl+f" && xdotool type "`echo $name`"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################



recog=$(echo "$UTTERANCE" | awk '{print $1, $2}' | grep "$CMD_SAY_HI" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	name=$(echo "$UTTERANCE" | sed 's/'"$CMD_SAY_HI"' //g;s/'"$CMD_SAY_HI"'//')
	the_text_encoded=$(echo "Hello "$name" Have a nice day!")
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/say_hi_to.mp3" "http://translate.google.com/translate_tts?tl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/say_hi_to.mp3
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_HELLO" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	the_text_encoded=$(echo "Hello `whoami`, Have a nice day!")
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/user-is-it.mp3" "http://translate.google.com/translate_tts?tl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/user-is-it.mp3 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_WHOAMI" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	the_text_encoded=$(echo "Your name of user is `whoami`")
wget -A.mp3 -U "\"Mozillla\"" -O "/tmp/user-is-it.mp3" "http://translate.google.com/translate_tts?tl="$lang"&q=$(python -c "import urllib; print urllib.quote('''$the_text_encoded''')")&ie=UTF-8"
audacious /tmp/user-is-it.mp3 
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
if [ -d $HOME/"$folder/$directory" ]; then
nautilus $HOME/"$folder/$directory"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
if echo "$UTTERANCE" | grep -x -i "$CMD_OPEN_FOLDER $command_line\|$CMD_OPEN_FOLDER_OF $command_line"; then
nautilus $HOME/"$folder"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

cd $HOME/"$folder"
sub_folder=$(find -maxdepth 1 -type d -print | sed 's|./||g' | grep -i "$directory" )
if [ -d $HOME/"$folder/$sub_folder" ]; then
nautilus $HOME/"$folder/$sub_folder"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
arecord -q -f cd -t wav -d "$recording" -r 16000 | flac - -f --best --sample-rate 16000 -o /tmp/dictation_mode/voice_.flac  2>/dev/null

mv /tmp/dictation_mode/voice_.flac /tmp/dictation_mode/voice_"$number_process".flac
recognise "$number_process" &
record
}
if [ -f /tmp/dictation_mode/line_of_process ] ; then
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-off.png" "End of recording ..." 
script_process=$(cat /tmp/dictation_mode/line_of_process)
kill -HUP "$script_process"
rm -rf /tmp/dictation_mode
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
sh /tmp/if_internal_active
rm /tmp/if_internal_active
rm /tmp/progress_active
if [ -f /tmp/port_errors ] ; then
rm /tmp/port_errors
fi
exit 1;
fi
mkdir /tmp/dictation_mode/
echo "$$" > /tmp/dictation_mode/line_of_process
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "Recording ..." 
echo "Result:"
echo "0" > /tmp/dictation_mode/number_of_process
echo "echo -n "'"'"                                "'"'"\\\\r" > /tmp/if_internal_active
ports=$(pacmd list-sources | grep "active port")
if echo "$ports" | grep -q -v "active port: <analog-input-microphone>\|active port: <analog-input-microphone;"; then
v-c -mic "$microphe_port" >/tmp/port_errors
if sed -n '2p' /tmp/port_errors | grep -q -v "The configuration of microphone, now is with this ports:"; then
cat /tmp/port_errors
rm /tmp/port_errors
rm /tmp/line_of_process
rm /tmp/process_result
rm /tmp/if_internal_active
exit 1
fi
echo "pacmd set-source-port "$microphe_port" '`echo "$ports" | cut -d'>' -f1 | cut -d'<' -f2 `'  >/tmp/port_errors && echo -n "'"'"                                "'"'"\\\\r"  > /tmp/if_internal_active
fi

record

	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_UNDO" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+z"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_REDO" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Shift+z"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_FAV\|$CMD_DEL_LINE\|$CMD_CLOSE_TERM" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+d"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MAIL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch MailReader
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_COPY" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+c"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_PASTE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+v"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CUT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+x"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SELECT_ALL" )
	if [ "$recog" != "" ]
	then
	xdotool key "Ctrl+a"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SAVE" )
	if [ "$recog" != "" ]
	then
	xdotool key "Ctrl+s"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SAVE_AS" )
	if [ "$recog" != "" ]
	then
	xdotool key "Ctrl+Shift+s"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 1
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_FOLDER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Shift+n"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MINIMISE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Alt+0"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MAXIMISE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Alt+5"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_FULLSCREEN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "F11"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TAB" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Tab"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ESC" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Escape"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_MENU" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+F1"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ACTIONS_MENU" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "F10"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CLOSE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+q"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CLOSE_WIN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+w"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ZOOM_OUT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86ZoomOut"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ZOOM_IN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86ZoomIn"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TOUCH_ON_OFF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86TouchpadToggle"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################

recog=$(echo "$UTTERANCE" | grep -x "$CMD_ZOOM_RESET" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+0"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BACK" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+Left"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ADVANCE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+Right"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_RIGHT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Right"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_LEFT" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Left"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Down"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Up"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_PAGE_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key KP_Page_Up
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_HOME_PAGE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Home"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_END_PAGE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+End"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_HOME" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Home"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_END" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "End"
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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

mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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

mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_PAGE_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key KP_Page_Down
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_DELETE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Delete"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_ENTER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key KP_Enter
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_NEW_WINDOW" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+n"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_CHANGE_TAB" )
	if [ "$recog" != "" ]
	then
	winds=$(echo "$UTTERANCE" | sed 's/'"$CMD_CHANGE_TAB"' //g;s/'"$CMD_CHANGE_TAB"'//g;s/ //g;s/ten/010/g;s/once/011/g;s/twelve/012/g;s/thirteen/013/g;s/fourteen/014/g;s/fifteen/015/g;s/sixteen/016/g;s/ten/01/g;s/twenty/020/g;s/veinti/020/g;s/treintay/03/g;s/cuarentay/040/g;s/cincuentay/050/g;s/sesentay/060/g;s/setentay/070/g;s/ochentay/080/g;s/noventay/090/g;s/treintai/030/g;s/thirty/030/g;s/cuarentai/040/g;s/forty/040/g;s/cincuentai/050/g;s/fifty/050/g;s/sesentai/060/g;s/sixty/060/g;s/setentai/070/g;s/seventy/070/g;s/ochentai/080/g;s/eighty/080/g;s/noventai/090/g;s/ninety/090/g;s/two hundred/200/g;s/three hundred/300/g;s/four/400/g;s/five hundred/500/g;s/six hundred/600/g;s/seven/700/g;s/eight/800/g;s/nine/900/g;s/percent/100/g;s/hundred/100/g;s/one/01/g;s/un/01/g;s/two/02/g;s/three/03/g;s/four/04/g;s/five/05/g;s/six/06/g;s/seven/07/g;s/eight/08/g;s/nine/09/g;s/016/16/g;s/017/17/g;s/018/18/g;s/019/19/g;s/020/20/g;s/030/30/g;s/040/40/g;s/050/50/g;s/060/60/g;s/070/70/g;s/080/80/g;s/090/90/g;s/001/1/g;s/002/2/g;s/003/3/g;s/004/4/g;s/005/5/g;s/006/6/g;s/007/7/g;s/008/8/g;s/009/9/g' | sed 's/^[0]*//' )
	echo "number `echo $winds`"
	xdotool key Alt+`echo $winds`
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_CLOSE_TAB" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+w"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BROWSER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch WebBrowser
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_FILE_MANAGER" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch FileManager
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TERMINAL" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	exo-open --launch TerminalEmulator
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_EXECUTE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Alt+F2"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TEXT_EDITOR" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	gedit
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TAKE_PICTURE" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	cheese & sleep 2s
	xdotool type " "
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_TAKE_VIDEO" )
	if [ "$recog" != "" ]
	then
	notify-send "Comando:"  "$recog"
	cheese & sleep 2s
	xdotool key "Tab"
	xdotool key "Tab"
	xdotool key KP_Enter
	xdotool type " "
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | awk '{print $1}' | grep -x "$CMD_ALARM" )
	if [ "$recog" != "" ]
	then
	number=$(echo "$UTTERANCE" | sed 's/'"$CMD_ALARM"' //g;s/'"$CMD_ALARM"'//g' )
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
#	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
#exit 1
#fi
sleep $alarm && audacious ""${SONGS_PATH}"/vip ringtone.mp3"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
echo "echo -n "'"'"                                "'"'"\\\\r" > /tmp/if_internal_active
ports=$(pacmd list-sources | grep "active port")
if echo "$ports" | grep -q -v "active port: <analog-input-microphone>\|active port: <analog-input-microphone;"; then
v-c -mic "$microphe_port" >/tmp/port_errors
if sed -n '2p' /tmp/port_errors | grep -q -v "The configuration of microphone, now is with this ports:"; then
cat /tmp/port_errors
rm /tmp/port_errors
rm /tmp/line_of_process
rm /tmp/process_result
rm /tmp/if_internal_active
exit 1
fi
echo "pacmd set-source-port "$microphe_port" '`echo "$ports" | cut -d'>' -f1 | cut -d'<' -f2 `'  >/tmp/port_errors && echo -n "'"'"                                "'"'"\\\\r"  > /tmp/if_internal_active
fi

rec -r 16000 -c 1 -t mp3  ~/".$fecha record-reminder Sleeping:$alarm.mp3" 2>&1 | awk -vRS="\r" '$1 ~ /In/ {gsub(/In:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $3"\n# Record reminder.\\n\\nClose this window to\\nend recording.\\n\\nTime:\\t"$2"\\nSize :\\t"$4; fflush();}' | zenity --window-icon="/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" --progress --pulsate --no-cancel --auto-kill --auto-close --width="255" --height="190" --title=" Recording ..."
sh /tmp/if_internal_active
rm /tmp/if_internal_active
rm /tmp/progress_active
if [ -f /tmp/port_errors ] ; then
rm /tmp/port_errors
fi
	sleep $alarm && audacious ~/".$fecha record-reminder Sleeping:$alarm.mp3"
}

cinco()
{
echo "Alarm:$alarm"
text_in=$(zenity --title "Text reminder" --width="335" --height="310" --text-info --editable | awk '{ printf "%s ", $0 }')
echo "$text_in" > /tmp/Texto_recordatorio-temp
mv /tmp/Texto_recordatorio-temp ~/".$fecha.Alarm sleeping by: $alarm.txt"
sleep $alarm && audacious ""${SONGS_PATH}"/vip ringtone.mp3"
if (zenity --title "Text reminder" --width="335" --height="310" --text-info --checkbox "Check the box to save the text." --filename="$HOME/.$fecha.Alarm sleeping by: $alarm.txt")
then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" ~/"$fecha.Alarm sleeping by: $alarm.txt"
DESTINO=$(zenity --file-selection --filename="$HOME/$fecha.Alarm sleeping by: $alarm.txt" --save)
mv "$HOME/$fecha.Alarm sleeping by: $alarm.txt" "$DESTINO"
exit 0;
fi
if [ -f ~/".$fecha.Alarm sleeping by: $alarm.txt" ]; then
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" `xdg-user-dir DESKTOP`

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
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" `xdg-user-dir DESKTOP`

fi
}
siete()
{
echo "Alarm:$alarm"
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" " Recording ..." 
echo "echo -n "'"'"                                "'"'"\\\\r" > /tmp/if_internal_active
ports=$(pacmd list-sources | grep "active port")
if echo "$ports" | grep -q -v "active port: <analog-input-microphone>\|active port: <analog-input-microphone;"; then
v-c -mic "$microphe_port" >/tmp/port_errors
if sed -n '2p' /tmp/port_errors | grep -q -v "The configuration of microphone, now is with this ports:"; then
cat /tmp/port_errors
rm /tmp/port_errors
rm /tmp/line_of_process
rm /tmp/process_result
rm /tmp/if_internal_active
exit 1
fi
echo "pacmd set-source-port "$microphe_port" '`echo "$ports" | cut -d'>' -f1 | cut -d'<' -f2 `'  >/tmp/port_errors && echo -n "'"'"                                "'"'"\\\\r"  > /tmp/if_internal_active
fi

rec -r 16000 -c 1 -t flac  /tmp/grabacion-recordatorio.flac 2>&1 | awk -vRS="\r" '$1 ~ /In/ {gsub(/In:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $3"\n# Record reminder.\\n\\nClose this window to\\nend recording.\\n\\nTime:\\t"$2"\\nSize :\\t"$4; fflush();}' | zenity --window-icon="/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" --progress --pulsate --no-cancel --auto-kill --auto-close --width="255" --height="190" --title=" Recording ..." 

JSON=`curl -s -X POST \
--data-binary @'/tmp/grabacion-recordatorio.flac' \
--header 'Content-Type: audio/x-flac; rate=16000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&lang='$lang'&key='$key'' | cut -d\" -f8 `
mv /tmp/grabacion-recordatorio.flac ~/".$fecha record-reminder Sleeping:$alarm.flac"
sh /tmp/if_internal_active
rm /tmp/if_internal_active
rm /tmp/progress_active
if [ -f /tmp/port_errors ] ; then
rm /tmp/port_errors
fi
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
mv ~/".$fecha.Alarm sleeping by: $alarm.txt" `xdg-user-dir DESKTOP`

fi
}

dialogo()
{
	opcion=$( zenity --list --text="Options of alarms" --radiolist --width="330" --height="285" --title="Alarms"  \
					--column='Click' --column='Option'  \
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
mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
fi
	notify-send "Command, Alaram is:" "sleep ( 0 - 9 ) d ( 0 - 9 ) h ( 0 - 9 ) m ( 0 - 9 ) s 
Alaram off"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 1;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_LOG_OFF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "Ctrl+Alt+BackSpace"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BRIGHTNESS_UP" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86MonBrightnessUp"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_BRIGHTNESS_DOWN" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86MonBrightnessDown"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_POWER_OFF" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	xdotool key "XF86PowerOff"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_CALCULATOR" )
	if [ "$recog" != "" ]
	then
	notify-send "Command:"  "$recog"
	numb_smimb=$(echo "$UTTERANCE" | sed 's/'"$CMD_CALCULATOR"' //g;s/'"$CMD_CALCULATOR"'//g;s/subtracts/−/g;s/less/−/g;s/multiplied by/×/g;s/divided/÷/g;s/divided/÷/g;s/about/÷/g;s/percent/%/g;s/percentage/%/g;s/per/×/g;s/squared/²/g;s/square/²/g;s/square root of/√/g;s/square root/√/g;s/root/√/g;s/point/,/g;s/comma/,/g;s/ //g')
lines=$(echo "xdotool type "$numb_smimb"" | sed 's/more/ && xdotool key 0x002b && xdotool type /g;s/mas/ && xdotool key 0x002b && xdotool type /g;s/sum/ && xdotool key 0x002b && xdotool type /g' )
echo "#/bin/bash
$lines" > /tmp/script_calc.temp
chmod +x /tmp/script_calc.temp
	gcalctool & sleep 1 && sh /tmp/script_calc.temp
	rm /tmp/script_calc.temp
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_SCREENSHOT" )
	if [ "$recog" != "" ]
	then
	echo "Screenshot of `date +%Y`-`date +%m`-`date +%d`:`date +%k`:`date +%M`:`date +%S`.png" > /tmp/date-to-pict.temp
	DATE_PIC=$(cat /tmp/date-to-pict.temp)
	import -window root `xdg-user-dir PICTURES`/"$DATE_PIC"
	eog `xdg-user-dir PICTURES`/"$DATE_PIC"
	rm /tmp/date-to-pict.temp
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi

###################################################################


recog=$(echo "$UTTERANCE" | grep -x "$CMD_OPEN_FILE" )
	if [ "$recog" != "" ]
	then
	notify-send "Comando:"  "$recog"
	xdotool key "Ctrl+o"
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi


###################################################################


recog=$(echo "$UTTERANCE" | grep "$CMD_OFFICE" )
	if [ "$recog" != "" ]
	then
	docs=$(echo "$UTTERANCE" | sed 's/'"$CMD_OFFICE"' //g;s/'"$CMD_OFFICE"'//')

Action_Writer=$(echo "$UTTERANCE" | grep "$Writer" )
	if [ "$Action_Writer" != "" ]
	then
libreoffice --writer
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
Action_Calc=$(echo "$UTTERANCE" | grep "$Calc" )
	if [ "$Action_Calc" != "" ]
	then
libreoffice --calc
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
Action_Impress=$(echo "$UTTERANCE" | grep "$Impress" )
	if [ "$Action_Impress" != "" ]
	then
libreoffice --impress
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
Action_Draw=$(echo "$UTTERANCE" | grep "$Draw" )
	if [ "$Action_Draw" != "" ]
	then
libreoffice --draw
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
Action_Math=$(echo "$UTTERANCE" | grep "$Math" )
	if [ "$Action_Math" != "" ]
	then
libreoffice --math
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
exit 0;
fi
	mv /tmp/speech_recognition.tmp /tmp/speech_recognition_prev.tmp
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
