# Voice commands (command your PC with spoken commands) #

You can modify the commands below to better use in the file: ~/.voice_commands/"v-c LANGS"/commands-en

The function of this program starts running play_stop.sh script, which will start recording your voice, and if after five seconds, or run it again, start voice recognition, for now, make one of all commands available.
Also can repeat the last command with RETRY function
Orders can be just a simple context: << order >> , or double context: << order >> << cited-text >>
Available commands are 95

After installed we can launch it from Applications, Universal Access, Voice Commands
And you can drag and drop on the gnome panel, and to call it a keyboard shortcut, eg. F6, this is the command:
# Changing $USER, to your user name: /home/$USER/.voice_commands/play_stop.sh
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

v-c -mic [NUM]	Set port, to default [1,2,3...]. And, if [input-"1,2,3..."].

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
 « v-c -mic '1, 2,...' input-' ' » [ empty for 'reset' to no ";input-" ]

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

################################
   SELECT_FILE << cited-text >>
   (select | select file)
################################
   MUSIC_START
   (put music | music player | music | pause | music start)
################################
   MUSIC_START_SONG << cited-text >>
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
   TRANSLATE [from] [to] << cited-text >>
   (translate | translates the | translation | translates of | translate from | translated from | translation from | dictionary of the | translates the | translation of the)
################################
   WRITE
   (write | type)
################################
   WRITE_CAPITAL
   (capitalize | write capital | type capital)
################################
   WRITE_CAPITAL_ALL << cited-text >>
   (write all uppercase | write everything capital | write everything capitalized)
################################
   SAY_THIS << cited-text >>
   (say this | say | say me)
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
   (who i am | who am i)
################################
   OPEN_FOLDER << cited-text >>
   (open folder | open directory | open folder of | open directory of)
################################
   SAY_TIME
   (say time | say the time | say me the time | tell me the hour | what the time is | what time is it | what the time)
################################
   SAY_DATE
   (say date | date is | which day is | that date today | which day is today | tell me the date | on what date we are)
################################
   DICTATION << cited-text-continuo >>
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
   CHANGE_TAB << cited-numbers >>
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
   ALARM << cited-numbers [days] [hours] [minutes] [seconds] to sleep >>
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
   CALCULATOR << cited-operation >>
   (calculated | calculate | the counting | making operation | make the calculation | calculator)
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

You can find many more features available with this command:
Multimedia and Media:
# grep "XK_" /usr/include/X11/XF86keysym.h|sed 's/XK_//g' > ~/"More commands" && gedit ~/"More commands"
All the others:
# grep "XK_" /usr/include/X11/keysymdef.h|sed 's/ XK_/ /g' > ~/"Many more commands" && gedit ~/"Many more commands" 

With these you can create your own actions.
Use 'xdotool key XF86...', or 'xdotool key "Combination+of+keys "' for key functions,
and for write 'xdotool type "write whatever you want"'

If some do not have it configured, you can do it in System Settings, Keyboard, Keyboard Shortcuts. If the functions are listed as active but try and not to walk, please point the keyboard shortcut, click on the combination with established key again and it will offer New accelerator, and select the same source contained.
There are more options in Keyboard Settings distribution options. As log out, with Killing X, with (Ctrl+Alt+BackSpace).
The "+" only when you type the command doesn't when you press it, in this case do not push.

# Download others languages on Gnome-Look.org
http://gnome-look.org/content/show.php?content=165529

############# Written by Rodrigo Esteves ###############
### baitsart@gmail.com www.youtube.com/user/baitsart ###
# GNU License. You are free to modify and redistribute #


