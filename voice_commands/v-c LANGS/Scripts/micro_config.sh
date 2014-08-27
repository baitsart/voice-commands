#!/bin/bash
microphe_port="$1"
input="$2"
echo `pacmd set-source-port "$microphe_port" "analog-input-microphone"$input""` > /tmp/mic_port_errors
port_errors=$(cat /tmp/mic_port_errors | cut -d '>' -f4)
if grep -q "No source found by this name or index\|Failed to set source port to" /tmp/mic_port_errors;then
echo "
Wrong entry to set port, on mic configuration. Try on:

gnome-control-center sound input

And test, proving, which microphone is the correct, if is Microphone, ( not Internal Microphone ), the command will be:

 « v-c -mic '1, 2,...' »

 and, if is Microphone / Microphone '1, 2,...', then will be:

 « v-c -mic '1, 2,...' input-'1, 2,...' »
 « v-c -mic '1, 2,...' input-' ' » [ empty for 'reset' to no "'"'";input-"'"'" ]

 to have it configured.

Output command:
 'pacmd set-source-port "$microphe_port" 'analog-input-microphone"$input"''
 Message:
"$port_errors"

Try again, with above indications, good luck!
"
rm /tmp/mic_port_errors
exit 1
fi
sed -i 's/microphone=1/microphone='"$microphe_port"'/' ~/.voice_commands/"v-c LANGS"/Scripts/microphone_port ~/.voice_commands/"v-c LANGS"/Scripts/micro_config.sh
sed -i 's/input_port=/input_port='"$input_opt"'/' ~/.voice_commands/"v-c LANGS"/Scripts/input_port ~/.voice_commands/"v-c LANGS"/Scripts/micro_config.sh
echo "
The configuration of microphone, now is with this ports:

pacmd set-source-port "$microphe_port" 'analog-input-microphone"$input"'
"
rm /tmp/mic_port_errors
exit 0

