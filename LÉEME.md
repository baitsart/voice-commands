# Comandos de Voz (comanda tu PC con órdenes habladas)  #

Puede modificar los comandos de abajo para un mejor uso, en el archivo: /home/$USER/.voice_commands/"v-c LANGS"/commands-en

La función de éste programa se inicia ejecutando el script play_stop.sh, el cual comenzará a grabar su voz, y si transcurren cinco segundos, o si lo vuelves a ejecutar, iniciará el reconocimiento de voz, para ya, realizar uno de todos los comandos disponibles.
Las órdenes pueden ser simples de un sólo contexto: << orden >>, o de doble contexto: << orden >> << texto-citado >>
También se puede repetir el último comando con función: RETRY
Las órdenes disponibles son 95

Después de instalado lo podrás lanzar desde Aplicaciones, Acceso universal, Comandos de Voz
Y lo puedes arrastrar y soltar en el panel de gnome, y para llamarlo de un atajo de teclado, por ej. F6, éste es el comando: 
# Cambiando $USER por to nombre de usuario: /home/$USER/.voice_commands/play_stop.sh
Y lo puede llamar así:
v-c
o,
voice-commands

------------------------------------------------------------

#	##	v-c , command line options	##	#
v-c -r		Run
v-c -l -lang	To select another, of 67 languages for recognition.
v-c -t -try	To try any command, of default lang, or, a [-lang].
v-c -m -mod	To modify the commands file, and the README file.
v-c -h		Show instructions README file.
v-c --help	Show this message

------------------------------------------------------------
Dependencias:
Acceso a internet.
Micrófono activo, y con volumen correcto, Micrófono, o Micrófono interno. Está en: Configuración del sistema, Sonido, Entrada.

Instalar dependencias:

sudo apt-get install xdotool gawk curl wget cheese audacious sox alsa-utils

Programas que usa y ya están en la distribución:
rhythmbox nautilus gcalctool gedit eog libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math

##### ACCIONES DISPONIBLES #####

   Nombre del comando
   *se activa con*

################################
   SELECT_FILE << cited-text >>
   (select)
################################
   MUSIC_START
   (put music | music play | music player | music | pause)
################################
   MUSIC_START_SONG << cited-text >>
   (put music of | music of | play to | play music of)
################################
   MUSIC_PLAY
   (play music | pause music | start music | stop music | stop music)
################################
   MUSIC_NEXT
   (next song | next track)
################################
   MUSIC_PREV
   (previous song | previous track)
################################
   MUSIC_SHUFFLE
   (random music | mix | do not mix)
################################
   MUSIC_REPEAT
   (repeat | not repeat)
################################
   VIDEO_REW
   (delay | rewind | go back)
################################
   VIDEO_FF
   (forward | go forward)
################################
   VOLUME_DOWN
   (lower the volume | volume down | less volume | volume less)
################################
   VOLUME_UP
   (increase the volume | volume up | more volume | volume more)
################################
   VOLUME_MUTE
   (no audio | no volume | turn off audio | dumb)
################################
   SEARCH << cited-text >>
   (search)
################################
   NO_RESALT
   (remove highlighting | remove highlighted | no highlighting | no highlighted)
################################
   TRANSLATE [from] [to] << cited-text >>
   (translate | translates the | translation | translates of | translate from | translated from | translation from | dictionary of the | translates the | translation of the)
################################
   WRITE << cited-text >>
   (write | type)
################################
   WRITE_CAPITAL << cited-text >>
   (capitalize | type capital)
################################
   WRITE_CAPITAL_ALL << cited-text >>
   (write all uppercase | write everything capitalized)
################################
   SAY_THIS << cited-text >>
   (say this | say)
################################
   GOOGLE_SEARCH << cited-text >>
   (search google | internet search | meaning of | what is | search the dictionary)
################################
   YOUTUBE_SEARCH << cited-text >>
   (search on youtube | what about | search videos | videos )
################################
   WIKI_SEARCH << cited-text >>
   (search wiki | search wikipedia | wikipedia)
################################
   WEATHER << cited-text >>
   (weather | climate)
################################
   SEARCH_MAPS << cited-text >>
   (map | map search | map of | map from | where is)
################################
   SAY_HI << cited-text >>
   (greets to | say hi to)
################################
   HELLO
   (hello machine)
################################
   WHOAMI
   (who i am)
################################
   OPEN_FOLDER << cited-text >>
   (open folder)
################################
   OPEN_FOLDER_OF << cited-text >>
   (open folder of)
################################
   SAY_TIME
   (tell me the hour | what the time is | what time is it)
################################
   SAY_DATE
   (date is | which day is | that date today | which day is today | tell me the date | on what date we are)
################################
   DICTATION << cited-text-continuously >>
   (dictation mode | out dictation mode | end dictation mode)
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
   (save as | save page as)
################################
   FOLDER
   (create folder | new folder)
################################
   MINIMISE
   (minimize)
################################
   MAXIMISE
   (maximize)
################################
   FULLSCREEN
   (full screen | fullscreen)
################################
   TAB
   (key tab | tabulation | tab)
################################
   ESC
   (escape)
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
   (ward | shrink | decrease | zoom less)
################################
   ZOOM_IN
   (approximate | enlarge | raise | zoom more)
################################
   ZOOM_RESET
   (normal size | zero zoom)
################################
   TOUCH_ON_OFF
   (turn off touchpad | turn on touchpad | touchpad)
################################
   BACK
   (over | back)
################################
   ADVANCE
   (move | forward)
################################
   RIGHT
   (right)
################################
   LEFT
   (left)
################################
   DOWN
   (down)
################################
   UP
   (go up)
################################
   PAGE_DOWN
   (page down)
################################
   PAGE_UP
   (page up)
################################
   HOME_PAGE
   (top of page | go to top of page | go to the top)
################################
   END_PAGE
   (end of page | go to end of page | go to the end)
################################
   HOME
   (top of)
################################
   END
   (the end)
################################
   SCROLL_DOWN
   (run page down | run down)
################################
   SCROLL_UP
   (run page up | run up)
################################
   DELETE
   (delete)
################################
   ENTER
   (open | execute | enter)
################################
   NEW_WINDOW
   (new window)
################################
   CHANGE_TAB
   (window move | go to window | switch to window | window | move tab | go to tab | switch to tab)
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
   (launch command | run command)
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
   ALARM << cited-numbers [days] [hours] [minutes] [seconds]>>
   (alarm | start alarm at)
################################
   LOG_OFF
   (logout | system logout)
################################
   BRIGHTNESS_UP
   (raise the brightness | brighten up | shine up | up brightness | increase brightness)
################################
   BRIGHTNESS_DOWN
   (lower the brightness | decrease brightness | brightness down | shine down | decrease brightness)
################################
   POWER_OFF
   (shut down the system | turn off the machine | turn off the computer | turn off computer | power off)
################################
   CALCULATER
   (calculator)
################################
   TAKE_PICTURE
   (photo | take a picture)
################################
   TAKE_VIDEO
   (record | record video | record a video)
################################
   OPEN_FILE
   (open file | open a new file)
################################
   OFFICE << cited-text [ writer, calc, impress, draw, math ] >>
   (open new document | open new document of | create new document | create new document of | create new | open new)
Writer (text)
Calc (calc)
Impress (presentation | page | web)
Draw (drawing | graphic)
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


