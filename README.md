# Voice commands (command your PC with spoken commands) #

You can modify the commands down below for a better usage, on the file: speech_commands.sh
  
The function of this program starts running play_stop.sh script, which will start recording your voice, and if after five seconds, or run it again, start voice recognition, for now, make one of all commands available.
Also can repeat the last command with RETRY function
Orders can be just a simple context: << order >> , or double context: << order >> << cited-text >>
Available commands are 87

After installed we can launch it from Applications, Universal Access, Voice Commands
And you can drag and drop on the gnome panel, and to call it a keyboard shortcut, eg. F6, this is the command: 
# Changing $USER, to your user name: /home/$USER/.voice_commands/play_stop.sh

Dependencies:
Internet access.
Active, and correct volume Microphone, Check: System Settings, Sound, Internal microphone, to Microphone.

Install dependencies:
sudo apt-get install xdotool gawk curl wget cheese audacious sox alsa-utils

Programs that are already in use and the distribution:
rhythmbox nautilus gcalctool gedit eog libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math

##### ACTIONS AVAILABLE #####

   Command name
   *activate with*

################################
   SELECT_FILE
   (select)
################################
   MUSIC_START
   (put music | music play | music player | music | pause)
################################
   MUSIC_START_SONG
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
   SEARCH
   (search)
################################
   NO_RESALT
   (remove highlighting | remove highlighted | no highlighting | no highlighted)
################################
   TRANSLATE
   (translate | translates the | translation | translates of | translate from | translated from | translation from | dictionary of the | translates the | translation of the)
################################
   WRITE
   (write | type)
################################
   WRITE_CAPITAL
   (capitalize | type capital)
################################
   WRITE_CAPITAL_ALL
   (write all uppercase | write everything capitalized)
################################
   SAY_THIS
   (say this | say)
################################
   GOOGLE_SEARCH
   (search google | internet search | meaning of | what is | search the dictionary)
################################
   YOUTUBE_SEARCH
   (search on youtube | what about | search videos | videos | search videos | videos)
################################
   WIKI_SEARCH
   (search wiki | search wikipedia | wikipedia)
################################
   WEATHER
   (weather | climate)
################################
   SEARCH_MAPS
   (map | map search | map of | map from | where is)
################################
   SAY_HI
   (greets to | say hi to)
################################
   HELLO
   (hello machine)
################################
   WHOAMI
   (who i am)
################################
   OPEN_FOLDER
   (open folder)
################################
   OPEN_FOLDER_OF
   (open folder of)
################################
   SAY_TIME
   (tell me the hour | what the time is | what time is it)
################################
   SAY_DATE
   (date is | which day is | that date today | which day is today | tell me the date | on what date we are)
################################
   DICTATION
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
   (tabula | tabular | tab)
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
   ALARM
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
   OFFICE
   (open new document | open new document of | create new document | create new document of | create new | open new)
################################
   RETRY
   (retry command | repeat command | try again the command | retry | repeat | try again)
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


