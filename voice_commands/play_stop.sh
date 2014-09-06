#!/bin/bash

# Written by Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart 
# GNU License. You are free to modify and redistribute   # 

lang="en"
if [ -n "$1" ]; then
lang=$( echo "$1" | uniq )
echo "Language `cat ~/.voice_commands/Scripts/languages | sed 's/), (/\n/g;s/(//g;s/)//g' | grep "$lang " | cut -d' ' -f2 `"
fi
recording=5
key="AIzaSyBOti4mM-6x9WDnZIjIeyEU21OpBXqWBgw"
PROCESS=$$
CMD_RETRY=$(sed -n '111p' ~/.voice_commands/"v-c LANGS"/commands-"$lang" | cut -d "=" -f 2)
microphe_port=$(sed -n '1p' ~/.voice_commands/Scripts/microphone_port | cut -d '=' -f2)
input=$(sed -n '1p' ~/.voice_commands/Scripts/input_port | cut -d '=' -f2)

if [ -f /tmp/line_of_process ] ; then
PID=$(cat /tmp/process_result)
kill -HUP $PID 2>/dev/null
rm /tmp/line_of_process
> /tmp/result
sh ~/.voice_commands/play_stop.sh
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
if echo "$JSON" | sed 's/'"'"'/ /g'  | grep -x -q "$CMD_RETRY" ; then
[[ -f /tmp/speech_recognition_prev.tmp ]] || notify-send "No previous command" "Execute it again, please"
mv /tmp/speech_recognition_prev.tmp /tmp/speech_recognition.tmp
/bin/bash ~/.voice_commands/speech_commands.sh "$lang"
exit 1
fi
if echo "$JSON" | sed 's/'"'"'/ /g'  | grep -q "Your client does not have permission to get URL" ; then
if new_key=$( zenity --entry --text="The key speech-api/v2 google, should be updated.\nPlease enter a new correct key.\nOtherwise the process can not be made" --title="speech-api new key"); then
if
curl -s -X POST \
--data-binary @/tmp/voice_"$PID".flac \
--header 'Content-Type: audio/x-flac; rate=16000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&lang='$lang'&key='$new_key'' | grep "Your client does not have permission to get URL" ; then
notify-send "Wrong key, Message:" "Your client does not have permission to get URL"
exit 0
fi
sed -i 's/'"$key"'/'"$new_key"'/' ~/.voice_commands/play_stop.sh ~/.voice_commands/speech_commands.sh
sh ~/.voice_commands/play_stop.sh
exit 1
fi
exit
fi
echo "$JSON" | sed 's/'"'"'/ /g'  | sed '/^$/d' | tr '[:upper:]' '[:lower:]' > /tmp/speech_recognition.tmp
rm /tmp/voice_"$PID".flac
rm /tmp/result
killall notify-osd 2>/dev/null
/bin/bash ~/.voice_commands/speech_commands.sh "$lang"
rm /tmp/process_result
rm /tmp/if_internal_active
rm /tmp/progress_active
if [ -f /tmp/port_errors ] ; then
rm /tmp/port_errors
fi
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
sh /tmp/if_internal_active
transcribe
fi
}
echo "$PROCESS" > /tmp/process_result

pre_recog

 > /tmp/line_of_process


PID=$(cat /tmp/process_result)
killall notify-osd 2>/dev/null
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
notify-send "Recording..." "talk, please" 

echo "echo -n "'"'"  Talk, please. Recording.  "'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording.. "'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording..."'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording.  "'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording.. "'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording..."'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording.  "'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording.. "'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording..."'"'"\\\\r
sleep 0.5 &&
echo -n "'"'"  Talk, please. Recording.. "'"'"\\\\r" > /tmp/progress_active
sh /tmp/progress_active &
#paly ~/.voice_commands/sounds/"Recording, talk, please.mp3"
( rec -q -r 16000 -d /tmp/voice_.flac ) & pid=$!
( sleep "$recording"s && kill -HUP $pid ) 2>/dev/null & watcher=$!
wait $pid 2>/dev/null && pkill -HUP -P $watcher
sh /tmp/if_internal_active
killall notify-osd 2>/dev/null
> /tmp/result
pre_recog

exit 0;

