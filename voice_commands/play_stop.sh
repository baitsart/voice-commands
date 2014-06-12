#!/bin/bash

lang="en"
recording=5
key="AIzaSyBOti4mM-6x9WDnZIjIeyEU21OpBXqWBgw"
PKG_PATH=$(dirname "$(readlink -f "$0")")
PROCESS=$$


if [ -f /tmp/line_of_process ] ; then
PID=$(cat /tmp/process_result)
kill -HUP $PID 2>/dev/null
rm /tmp/line_of_process
> /tmp/result
sh "${PKG_PATH}"/play_stop.sh
exit
fi

transcribe()
{
echo "
RECOGNIZING THE VOICE"
notify-send "Testing voice command... " "Please wait"

JSON=`curl -s -X POST \
--data-binary @/tmp/voice_"$PID".flac \
--header 'Content-Type: audio/x-flac; rate=16000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&lang='$lang'&key='$key'' | cut -d\" -f8 `

echo "$JSON" | sed '/^$/d' | tr '[:upper:]' '[:lower:]' > /tmp/speech_recognition.tmp
rm /tmp/voice_"$PID".flac
rm /tmp/result
killall notify-osd 2>/dev/null
sh "${PKG_PATH}"/speech_commands.sh "$lang" "$key"
rm /tmp/process_result
if [ -f /tmp/line_of_process ] ; then
rm /tmp/line_of_process
exit
fi
exit 0;
}

pre_recog()
{
if [ -f /tmp/result ] ; then
PID=$(cat /tmp/process_result)
killall rec 2>/dev/null
mv /tmp/voice_.flac /tmp/voice_"$PID".flac
killall notify-osd 2>/dev/null
transcribe
fi
}
echo "$PROCESS" > /tmp/process_result

pre_recog

 > /tmp/line_of_process


PID=$(cat /tmp/process_result)
killall notify-osd 2>/dev/null
notify-send "Recording..." "talk, please" 
#paly "${PKG_PATH}"/sounds/"Recording, talk, please.mp3"
( rec -r 16000 -d /tmp/voice_.flac ) & pid=$!
( sleep "$recording"s && kill -HUP $pid ) 2>/dev/null & watcher=$!
wait $pid 2>/dev/null && pkill -HUP -P $watcher
killall notify-osd 2>/dev/null
> /tmp/result
pre_recog

exit 0;

