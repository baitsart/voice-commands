#!/bin/bash
lang="en"
string=$( echo "$@" | cut -d'=' -f1 )
orders=$( echo "$@" | cut -d'=' -f2 )
awk '{printf("%0d;" ,(NR)); print $0 }' ~/.voice_commands/Scripts/languages | sed '/'"$lang"' /d' | while read line; do
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
notify-send "New command: $string" "Translation complete"
