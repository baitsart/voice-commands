#!/bin/bash
TO="$1"
echo "# Comandos de Voz (comanda tu PC con órdenes habladas)  #

Puede modificar los comandos de abajo para un mejor uso, en el archivo: /usr/bin/voice_commands/"'"'"v-c LANGS"'"'"/commands-"$TO"

La función de éste programa se inicia ejecutando el script play_stop.sh, el cual comenzará a grabar su voz, y si transcurren cinco segundos, o si lo vuelves a ejecutar, iniciará el reconocimiento de voz, para ya, realizar uno de todos los comandos disponibles.
Las órdenes pueden ser simples de un sólo contexto: << orden >>, o de doble contexto: << orden >> << texto-citado >>
También se puede repetir el último comando con función: RETRY
Las órdenes disponibles son 95

Después de instalado lo podrás lanzar desde Aplicaciones, Acceso universal, Comandos de Voz
Y lo puedes arrastrar y soltar en el panel de gnome, y para llamarlo de un atajo de teclado, por ej. F6, éste es el comando: 
# Cambiando \$USER por tu nombre de usuario: /home/\$USER/.voice_commands/play_stop.sh
Primero instala el archivo de linea de comandos, con éste comando:
sudo cp ~/.voice_commands/v-c /usr/bin && sudo cp ~/.voice_commands/v-c /usr/bin/voice-commands
Y lo puede llamar así:
v-c
o,
voice-commands

------------------------------------------------------------

#	##	v-c , command line options	##	#

v-c -r		Correr
v-c -l -lang	Para seleccionar otro, de 67 idiomas de reconocimiento .
v-c -t -try	Para probar cualquier comando, de manera predeterminada lang, o un [-lang].
v-c -mic [NUM]	Configure el puerto, por defecto [1,2,3...]. Y, si es [input-"'"'"1,2,3..."'"'"].
v-c -vol	Establecer el volumen del micrófono que se usa por defecto. Nivel (<= 200).
v-c -m -mod	Para modificar el archivo de comandos y el archivo LÉEME.
v-c -u -update	Para actualizar el archivo LÉEME, luego de modificar el archivo de comandos.
v-c -h		Ver instrucciones del documento LÉEME.
v-c --help	Mostrar este mensaje

------------------------------------------------------------

Dependencias:
Acceso a internet.
Micrófono activo, y con volumen correcto, Micrófono, o Micrófono interno. Está en: Configuración del sistema, Sonido, Entrada.
Puedes modificar el puerto de micrófono, del comando que activa Micrófono, y lo vuelve a Micrófono interno, por defecto el puerto es el 1, si experimenta que no se realiza el reconocimiento puede modificarlo con el comando:

 « v-c -mic '1, 2,...' ». 

Y, si es Micrófono / Micrófono '1, 2,...', entonces sería asi:

 « v-c -mic '1, 2,...' input-'1, 2,...' »
 « v-c -mic '1, 2,...' input-' ' » [ vacío para 'reset' para "'"'";input-"'"'" ]


Si por errores de la traducción automática, tiene algúnos comandos mal escritos, o repetido, debe modificarlos, también, puede hacerlo con el comando:
v-c -m, o, v-c -mod
Y si su idioma usa apóstrofes, esto (') debe reemplazarlos por espacio esto ( ), porque podría generar conflictos.
En en los archivos:
/play_stop.sh y 
/speech_commands.sh


Instalar dependencias:

xdotool gawk curl wget cheese audacious sox flac pulseaudio alsa-utils

Programas que usa y ya están en la distribución:
rhythmbox nautilus gcalctool gedit eog libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math

##### ACCIONES DISPONIBLES #####

   Nombre del comando
   *se activa con*
" >> '/tmp/LEEME_TEMP'
echo "# Voice commands (command your PC with spoken commands) #

You can modify the commands below to better use in the file: /usr/bin/voice_commands/"'"'"v-c LANGS"'"'"/commands-"$TO"

The function of this program starts running play_stop.sh script, which will start recording your voice, and if after five seconds, or run it again, start voice recognition, for now, make one of all commands available.
Also can repeat the last command with RETRY function
Orders can be just a simple context: << order >> , or double context: << order >> << cited-text >>
Available commands are 95

After installed we can launch it from Applications, Universal Access, Voice Commands
And you can drag and drop on the gnome panel, and to call it a keyboard shortcut, eg. F6, this is the command:
# Changing \$USER, to your user name: /home/\$USER/.voice_commands/play_stop.sh
First install the command line file, typing this:
sudo cp ~/.voice_commands/v-c /usr/bin && sudo cp ~/.voice_commands/v-c /usr/bin/voice-commands
# Changing \$USER, to your user name: /home/\$USER/.voice_commands/play_stop.sh
First install the command line file, typing this:
sudo cp ~/.voice_commands/v-c /usr/bin && sudo cp ~/.voice_commands/v-c /usr/bin/voice-commands 

v-c
or,
voice-commands

------------------------------------------------------------

#	##	v-c , command line options	##	#

v-c -r		Run
v-c -l -lang	To select another, of 67 languages for recognition.
v-c -t -try	To try any command, of default lang, or, a [-lang].
v-c -mic [NUM]	Set port, to default [1,2,3...]. And, if [input-"'"'"1,2,3..."'"'"].
v-c -vol	Set the microphone volume that is used by default. Level (<= 200).
v-c -m -mod	To modify the commands file, and the README file.
v-c -u -update	To update the README file, after modify the script.
v-c -h		Show instructions README file.
v-c --help	Show this message

------------------------------------------------------------

Dependencies:
Internet access.
Active, and correct volume Microphone, Check: System Settings, Sound, Internal microphone, to Microphone.
You can modify the microphone port, of the command that activates microphone, and again to internal microphone, the default port is 1, if you have that recognition is not done, you can modify by command with:

 « v-c -mic '1, 2,...' »

 and, if is Microphone / Microphone '1, 2,...', then will be:

 « v-c -mic '1, 2,...' input-'1, 2,...' »
 « v-c -mic '1, 2,...' input-' ' » [ empty for 'reset' to no "'"'";input-"'"'" ]

And if by errors of machine translation, has commands some misspelled or repeated, must modify also, can doit with the command:
v-c -m, or, v-c -mod
If your language uses apostrophes this (') should replace by an space this ( ), because it could cause conflicts.
In the files: 
/play_stop.sh and 
/speech_commands.sh


Install dependencies:
xdotool gawk curl wget cheese audacious sox flac pulseaudio alsa-utils

Programs that use and are already in the distribution:
rhythmbox nautilus gcalctool gedit eog libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math

###### ACTIONS AVAILABLES ######

   Command name
   *activate with*
" >> '/tmp/README_TEMP'
lines_to_paste=$(cat  "/usr/bin/voice_commands/v-c LANGS/commands-$TO" | tr '\n' ';' | sed 's/SELECT_FILE/SELECT_FILE << texto-citado >>/g;s/MUSIC_START_SONG/MUSIC_START_SONG << texto-citado >>/g;s/SEARCH;/SEARCH << texto-citado >>;/g;s/TRANSLATE/TRANSLATE \[from\] \[to\] << texto-citado >>/g;s/WRITE;/WRITE << texto-citado >>;/g;s/WRITE_CAPITAL;/WRITE_CAPITAL << texto-citado >>;/g;s/WRITE_CAPITAL_ALL;/WRITE_CAPITAL_ALL << texto-citado >>;/g;s/SAY_THIS/SAY_THIS << texto-citado >>/g;s/GOOGLE_SEARCH/GOOGLE_SEARCH << texto-citado >>/g;s/YOUTUBE_SEARCH/YOUTUBE_SEARCH << texto-citado >>/g;s/WIKI_SEARCH/WIKI_SEARCH << texto-citado >>/g;s/WEATHER/WEATHER << texto-citado >>/g;s/SEARCH_MAPS/SEARCH_MAPS << texto-citado >>/g;s/SAY_HI/SAY_HI << texto-citado >>/g;s/;CMD_OPEN_FOLDER_OF=/\\|/g;s/OPEN_FOLDER/OPEN_FOLDER << texto-citado >>/g;s/DICTATION/DICTATION << texto-citado-continuo >>/g;s/CHANGE_TAB/CHANGE_TAB << números-citados >>/g;s/ALARM/ALARM << números-citados \[days\] \[hours\] \[minutes\] \[seconds\] to sleep >>/g;s/CALCULATOR/CALCULATOR << operación-citada >>/g;s/OFFICE/OFFICE << texto-citado \[ writer, calc, impress, draw, math \] >>/g;s/CMD_/);################################;   /g;s/=/;   (/g;s/;)/)/g;s/;Writer;  /);Writer/g;s/;Calc;  /);Calc/g;s/;Impress;  /);Impress/g;s/;Draw;  /);Draw/g;s/;Math;  /);Math/g;s/\\|/ | /g' | tr ';' '\n' | sed '1d' )

echo "`echo "$lines_to_paste"`)
################################

Puedes encontrar muchísimas más funciones disponibles con este comando:
Multimendia y medios:
# grep "'"'"XK_"'"'" /usr/include/X11/XF86keysym.h|sed 's/XK_//g' > ~/"'"'"Mas comandos"'"'" && gedit ~/"'"'"Mas comandos"'"'"
Todos los demás:
# grep "'"'"XK_"'"'" /usr/include/X11/keysymdef.h|sed 's/ XK_/ /g' > ~/"'"'"Muchos mas comandos"'"'" && gedit ~/"'"'"Muchos mas comandos"'"'" 

Con estos podrás crear tus propias acciones. 
Usa 'xdotool key XF86...', o 'xdotool key "'"'"Combinación+de+teclas"'"'"' para las funciones de teclas, 
y para escribir 'xdotool type "'"'"lo que quieras escribir"'"'"'

Si algunos no los tienes configurados, puedes hacerlo en Configuración del sistema, Teclado, Atajos de teclado. Si las funciones figuran como activas y al probarlas no andan, indícale nuevamente el atajo de teclado, con clic sobre la combinación de teclas establecida, y eso ofrecerá Acelerador nuevo, y elige el mismo que figuraba de origen. 
Hay más opciones en Teclado, Configuración de la distribución, Opciones. Como cerrar sesión, con Matar las X, con (Ctrl+Alt+BackSpace).
El "'"'"+"'"'" sólo cuando escribes el comando no cuando lo presionas, en éste caso no lo presiones.

# Descargarlo en otros idiomas en Gnome-Look.org
http://gnome-look.org/content/show.php?content=165529

############# Escrito por Rodrigo Esteves ##############
### baitsart@gmail.com www.youtube.com/user/baitsart ###
# Licencia GNU. Eres libre de modificar y redistribuir #

" >> '/tmp/LEEME_TEMP'
lines_to_paste_en=$(cat  "/usr/bin/voice_commands/v-c LANGS/commands-$TO" | tr '\n' ';' | sed 's/SELECT_FILE/SELECT_FILE << cited-text >>/g;s/MUSIC_START_SONG/MUSIC_START_SONG << cited-text >>/g;s/SEARCH;/SEARCH << cited-text >>;/g;s/TRANSLATE/TRANSLATE \[from\] \[to\] << cited-text >>/g;s/WRITE;/WRITE << cited-text >>;/g;s/WRITE_CAPITAL;/WRITE_CAPITAL << cited-text >>;/g;s/WRITE_CAPITAL_ALL;/WRITE_CAPITAL_ALL << cited-text >>;/g;s/SAY_THIS/SAY_THIS << cited-text >>/g;s/GOOGLE_SEARCH/GOOGLE_SEARCH << cited-text >>/g;s/YOUTUBE_SEARCH/YOUTUBE_SEARCH << cited-text >>/g;s/WIKI_SEARCH/WIKI_SEARCH << cited-text >>/g;s/WEATHER/WEATHER << cited-text >>/g;s/SEARCH_MAPS/SEARCH_MAPS << cited-text >>/g;s/SAY_HI/SAY_HI << cited-text >>/g;s/;CMD_OPEN_FOLDER_OF=/\\|/g;s/OPEN_FOLDER/OPEN_FOLDER << cited-text >>/g;s/DICTATION/DICTATION << cited-text-continuo >>/g;s/CHANGE_TAB/CHANGE_TAB << cited-numbers >>/g;s/ALARM/ALARM << cited-numbers \[days\] \[hours\] \[minutes\] \[seconds\] to sleep >>/g;s/CALCULATOR/CALCULATOR << cited-operation >>/g;s/OFFICE/OFFICE << cited-text \[ writer, calc, impress, draw, math \] >>/g;s/CMD_/);################################;   /g;s/=/;   (/g;s/;)/)/g;s/;Writer;  /);Writer/g;s/;Calc;  /);Calc/g;s/;Impress;  /);Impress/g;s/;Draw;  /);Draw/g;s/;Math;  /);Math/g;s/\\|/ | /g' | tr ';' '\n' | sed '1d')

echo "`echo "$lines_to_paste_en"`)
################################

You can find many more features available with this command:
Multimedia and Media:
# grep "'"'"XK_"'"'" /usr/include/X11/XF86keysym.h|sed 's/XK_//g' > ~/"'"'"More commands"'"'" && gedit ~/"'"'"More commands"'"'"
All the others:
# grep "'"'"XK_"'"'" /usr/include/X11/keysymdef.h|sed 's/ XK_/ /g' > ~/"'"'"Many more commands"'"'" && gedit ~/"'"'"Many more commands"'"'" 

With these you can create your own actions.
Use 'xdotool key XF86...', or 'xdotool key "'"'"Combination+of+keys "'"'"' for key functions,
and for write 'xdotool type "'"'"write whatever you want"'"'"'

If some do not have it configured, you can do it in System Settings, Keyboard, Keyboard Shortcuts. If the functions are listed as active but try and not to walk, please point the keyboard shortcut, click on the combination with established key again and it will offer New accelerator, and select the same source contained.
There are more options in Keyboard Settings distribution options. As log out, with Killing X, with (Ctrl+Alt+BackSpace).
The "'"'"+"'"'" only when you type the command doesn't when you press it, in this case do not push.

# Download others languages on Gnome-Look.org
http://gnome-look.org/content/show.php?content=165529

############# Written by Rodrigo Esteves ###############
### baitsart@gmail.com www.youtube.com/user/baitsart ###
# GNU License. You are free to modify and redistribute #

" >> '/tmp/README_TEMP'
mv '/tmp/LEEME_TEMP' "/usr/bin/voice_commands/v-c LANGS/LÉEME-$TO.md"
mv '/tmp/README_TEMP' "/usr/bin/voice_commands/v-c LANGS/README-$TO.md"
