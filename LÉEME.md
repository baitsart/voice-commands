# Comandos de Voz (comanda tu PC con órdenes habladas)  #

Puede modificar los comandos de abajo para un mejor uso, en el archivo: ~/.voice_commands/"v-c LANGS"/commands-en

La función de éste programa se inicia ejecutando el script play_stop.sh, el cual comenzará a grabar su voz, y si transcurren cinco segundos, o si lo vuelves a ejecutar, iniciará el reconocimiento de voz, para ya, realizar uno de todos los comandos disponibles.
Las órdenes pueden ser simples de un sólo contexto: << orden >>, o de doble contexto: << orden >> << texto-citado >>
También se puede repetir el último comando con función: RETRY, y adherir una nueva acción, con la función: ADD_NEW_ACTION
Las órdenes disponibles son 95

Después de instalado lo podrás lanzar desde Aplicaciones, Acceso universal, Comandos de Voz
Y lo puedes arrastrar y soltar en el panel de gnome, y para llamarlo de un atajo de teclado, por ej. F6, éste es el comando: 
# Cambiando $USER por tu nombre de usuario: /home/$USER/.voice_commands/play_stop.sh
Primero instala el archivo de linea de comandos, con éste comando:
sudo cp ~/.voice_commands/v-c /usr/bin && sudo cp ~/.voice_commands/v-c /usr/bin/voice-commands
Y lo puede llamar así:
v-c
o,
voice-commands

------------------------------------------------------------

#	##	v-c , command line options	##	#

v-c -r		Correr
v-c -l -lang	Para seleccionar otro, de 67 idiomas, en los comandos:
		 ( « -run », « -try », « -modify », « -update » and « -h » ).
v-c -t -try	Para tratar cualquier comando. « v-c -try "para las llamadas a métodos" »
v-c -mic [NUM]	ajuste el puerto, utilizar de forma predeterminada [1,2,3...]. y, si [input-"1,2,3..."].
v-c -vol	Establecer el volumen del micrófono que se usa por defecto. Nivel (<= 200).
v-c -m -mod	Para modificar el archivo de comandos y el archivo LÉEME.
v-c -u -update	Para actualizar el archivo LÉEME, luego de modificar el archivo de comandos.
v-c -a -add	Para agregar, Crear, Una nueva acción de comando de voz « v-c -add »,
		 or « v-c -add "nombre de la acción" »,
		 or « v-c -add "nombre de la acción=método de una llamada;otro método de llamada"
		La separación entre los NAME y ORDER Con =. Y entre ORDERS, Con ;
v-c -tr		Traducir alguna acción nueva, si no traducido aún.
v-c -v		Imprimir la versión del programa .
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
 « v-c -mic '1, 2,...' input-' ' » [ vacío para 'reset' para ";input-" ]


Si por errores de la traducción automática, tiene algúnos comandos mal escritos, o repetido, debe modificarlos, también, puede hacerlo con el comando:
v-c -m, o, v-c -mod
Y si su idioma usa apóstrofes, esto (') debe reemplazarlos por espacio esto ( ), porque podría generar conflictos.
En en los archivos:
/play_stop.sh y 
/speech_commands.sh


Instalar dependencias:

xdotool gnome-nettool gawk curl wget cheese audacious sox flac pulseaudio alsa-utils

Programas que usa y ya están en la distribución:
rhythmbox nautilus gcalctool gedit eog libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math

##### ACCIONES DISPONIBLES #####

   Nombre del comando
   *se activa con*

################################
   SELECT_FILE << texto-citado >>
   (select | select file)
################################
   MUSIC_START
   (put music | music player | music | pause | music start)
################################
   MUSIC_START_SONG << texto-citado >>
   (put music of | music of | play to | play music of | music start song)
################################
   MUSIC_PLAY
   (play music | pause music | music play | stop music | stop music)
################################
   MUSIC_NEXT
   (next song | next track | music next)
################################
   MUSIC_PREV
   (previous song | previous track | music previous)
################################
   MUSIC_SHUFFLE
   (random music | mix | do not mix | music shuffle)
################################
   MUSIC_REPEAT
   (repeat | not repeat | music repeat | music not repeat)
################################
   MEDIA_REW
   (delay | rewind | go back | music rewind | video rewind | media rewind)
################################
   MEDIA_FF
   (forward | go forward | music forward | video forward | media forward)
################################
   VOLUME_DOWN
   (lower the volume | volume down | less volume | volume less)
################################
   VOLUME_UP
   (increase the volume | volume up | more volume | volume more)
################################
   VOLUME_MUTE
   (no audio | no volume | turn off audio | dumb | mute)
################################
   SEARCH
   (search | find)
################################
   NO_STAND_OUT
   (remove stand out | remove highlighted | no stand out | no highlighted)
################################
   TRANSLATE [from] [to] << texto-citado >>
   (translate | translates the | translation | translates of | translate from | translated from | translation from | dictionary of the | translates the | translation of the)
################################
   WRITE
   (write | type)
################################
   WRITE_CAPITAL
   (capitalize | write capital | type capital)
################################
   WRITE_CAPITAL_ALL
   (write all uppercase | write everything capital | write everything capitalized)
################################
   SAY_THIS << texto-citado >>
   (say this | say | say me)
################################
   GOOGLE_SEARCH << texto-citado >>
   (search google | internet search | meaning of | what is | search the dictionary)
################################
   YOUTUBE_SEARCH << texto-citado >>
   (search on youtube | what about | search videos | videos )
################################
   WIKI_SEARCH << texto-citado >>
   (search wiki | search wikipedia | wikipedia)
################################
   WEATHER << texto-citado >>
   (weather | climate)
################################
   SEARCH_MAPS << texto-citado >>
   (map | map search | map of | map from | where is)
################################
   SAY_HI << texto-citado >>
   (greets to | say hi to)
################################
   HELLO
   (hello machine)
################################
   WHOAMI
   (who i am | who am i)
################################
   OPEN_FOLDER << texto-citado >>
   (open folder | open directory | open folder of | open directory of)
################################
   SAY_TIME
   (say time | say the time | say me the time | tell me the hour | what the time is | what time is it | what the time)
################################
   SAY_DATE
   (say date | date is | which day is | that date today | which day is today | tell me the date | on what date we are)
################################
   DICTATION << texto-citado-continuo >>
   (dictation mode | out dictation mode | end dictation mode | close dictation mode | out dictation | end dictation | close dictation )
################################
   UNDO
   (undo)
################################
   REDO
   (redo)
################################
   DEL_LINE
   (delete line)
################################
   FAV
   (add to favorite)
################################
   CLOSE_TERM
   (close the terminal | close terminal)
################################
   MAIL
   (open mail | open email | open mail | mail | email)
################################
   COPY
   (copy)
################################
   PASTE
   (paste)
################################
   CUT
   (cut)
################################
   SELECT_ALL
   (select all)
################################
   SAVE
   (save | save file)
################################
   SAVE_AS
   (save as | save page as | save file as)
################################
   FOLDER
   (create folder | new folder | create directory | new directory)
################################
   MINIMISE
   (minimize | minimize window)
################################
   MAXIMISE
   (maximize | maximize window)
################################
   FULLSCREEN
   (full screen | fullscreen)
################################
   TAB
   (key tab | tabulation | tab)
################################
   ESC
   (escape | escape key)
################################
   MENU
   (main menu | open main menu)
################################
   ACTIONS_MENU
   (menu | open menu | close menu)
################################
   CLOSE
   (close program | exit)
################################
   CLOSE_WIN
   (close window)
################################
   ZOOM_OUT
   (ward | shrink | decrease | zoom less | zoom out)
################################
   ZOOM_IN
   (approximate | enlarge | increase | raise | zoom more | zoom in)
################################
   ZOOM_RESET
   (normal size | zero zoom | no zoom | zoom reset | reset zoom)
################################
   TOUCH_ON_OFF
   (turn off touchpad | turn on touchpad | touchpad)
################################
   BACK
   (over | back)
################################
   ADVANCE
   (move | forward | advance)
################################
   RIGHT
   (right | one to right)
################################
   LEFT
   (left | one to left)
################################
   DOWN
   (down | go down)
################################
   UP
   (up | go up)
################################
   PAGE_DOWN
   (page down | go page down)
################################
   PAGE_UP
   (page up | go page up)
################################
   HOME_PAGE
   (top of page | go to top of page | go to the top | go to the principle)
################################
   END_PAGE
   (end of page | go to end of page | go to the end)
################################
   HOME
   (top of | home | principle)
################################
   END
   (the end | end)
################################
   SCROLL_DOWN
   (run page down | run down | scroll down)
################################
   SCROLL_UP
   (run page up | run up | scroll up)
################################
   DELETE
   (delete | remove)
################################
   ENTER
   (open | execute | enter)
################################
   NEW_WINDOW
   (new window | open new window | open a new window)
################################
   CHANGE_TAB << números-citados >>
   (window move | go to window | switch to window | window | move tab | go to tab | switch to tab | change to tab | change tab)
################################
   CLOSE_TAB
   (close tab)
################################
   BROWSER
   (browser | open browser | internet)
################################
   FILE_MANAGER
   (nautilus | file explorer | open nautilus | open file explorer)
################################
   TERMINAL
   (open the console | open terminal | terminal opens | open the terminal)
################################
   EXECUTE
   (launch command | run command | execute command)
################################
   BATTERY
   (battery | battery status | battery charge)
################################
   TEXT_EDITOR
   (text editor | open text editor | launch text editor | new text)
################################
   SCREENSHOT
   (screenshot | catch)
################################
   ALARM << números-citados [days] [hours] [minutes] [seconds] to sleep >>
   (alarm | start alarm at | start alarm to | start alarm for)
################################
   LOG_OFF
   (logout | system logout)
################################
   BRIGHTNESS_UP
   (raise the brightness | brighten up | shine up | up brightness | increase brightness)
################################
   BRIGHTNESS_DOWN
   (lower the brightness | decrease brightness | brightness down | shine down)
################################
   POWER_OFF
   (shut down the system | turn off the machine | turn off the computer | turn off computer | power off)
################################
   CALCULATOR << operación-citada >>
   (calculated | calculate | the counting | making operation | make the calculation | calculator)
Sum (more | and | summing | sum)
Rest (subtracts | less | resting | rest)
Multiplication (per | multiplied by | multiplied | by | multiplication | multiplying it)
Division (divided in | divided | dividing in | about | division)
Square (squared | square | at square | squared of | square of)
Percent (percent | percentage | percent of | percentage of)
Root (square root of | square root | root)
Dot (point | dot)
Comma (comma)
################################
   TAKE_PICTURE
   (photo | take a picture)
################################
   TAKE_VIDEO
   (record | record video | record a video)
################################
   ADD_NEW_ACTION
   (add new command | create new command | made new command | add a new command | create a new command | made new a command | new command | new order | new action)
################################
   OPEN_FILE
   (open file | open a new file)
################################
   OFFICE << texto-citado [ writer, calc, impress, draw, math ] >>
   (open new document | open a new document | open new document of | open a new document of | create new document | create a new document | create new document of | create a new document of | new document of | new office document of | create new | create a new | open new | open a new)
Writer (writer | text)
Calc (calc)
Impress (impress | presentation | page | web)
Draw (draw | drawing | graphic)
Math (formula | math)
################################
   RETRY
   (retry command | repeat command | try again the command | retry | try again)
################################

Puedes encontrar muchísimas más funciones disponibles con este comando:
Multimendia y medios:
# grep "XK_" /usr/include/X11/XF86keysym.h|sed 's/XK_//g' > ~/"Mas comandos" && gedit ~/"Mas comandos"
Todos los demás:
# grep "XK_" /usr/include/X11/keysymdef.h|sed 's/ XK_/ /g' > ~/"Muchos mas comandos" && gedit ~/"Muchos mas comandos" 

Con estos podrás crear tus propias acciones. 
Usa 'xdotool key XF86...', o 'xdotool key "Combinación+de+teclas"' para las funciones de teclas, 
y para escribir 'xdotool type "lo que quieras escribir"'

Si algunos no los tienes configurados, puedes hacerlo en Configuración del sistema, Teclado, Atajos de teclado. Si las funciones figuran como activas y al probarlas no andan, indícale nuevamente el atajo de teclado, con clic sobre la combinación de teclas establecida, y eso ofrecerá Acelerador nuevo, y elige el mismo que figuraba de origen. 
Hay más opciones en Teclado, Configuración de la distribución, Opciones. Como cerrar sesión, con Matar las X, con (Ctrl+Alt+BackSpace).
El "+" sólo cuando escribes el comando no cuando lo presionas, en éste caso no lo presiones.

# Descargarlo en otros idiomas en Gnome-Look.org
http://gnome-look.org/content/show.php?content=165529

############# Escrito por Rodrigo Esteves ##############
### baitsart@gmail.com www.youtube.com/user/baitsart ###
# Licencia GNU. Eres libre de modificar y redistribuir #


