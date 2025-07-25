#############____Binary__________
##		save as a executable on any bin directory eg . ~/bin/powermenu
 
#!/bin/env bash
 
# Options for powermenu
lock=""
logout=""
shutdown=""
reboot=""
sleep=""
 
# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
		  -theme "~/.config/bspwm/rofi/themes/dracula/powermenu.rasi")
# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    betterlockscreen --lock
elif [ "$selected_option" == "$logout" ]
then
    loginctl terminate-user `whoami`
elif [ "$selected_option" == "$shutdown" ]
then
    mpv ~/Music/alaram/shutdown.mp3 &
    doas systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    doas systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    amixer set Master mute
    doas systemctl suspend
else
    echo "No match"
fi
 
 
 
 
 
#___________________________POWERMENU THEME __________________________________
 
 
configuration {
    location:                       0;
    font:                           "Font Awesome 6 Free:style=regular";
}
 
 
* {
  border: 0;
  margin: 0;
  padding: 0;
  spacing: 0;
  background: #1B1B27;
  background-alt: #282a36;  
  line: #44475a; 
  foreground: #f8f8f2;  
  foreground-alt: #f8f8f2;  
  Comment: #6272a4; 
  selected: #ffb86c;
  Pink: #ff79c6;    
  Purple: #bd93f9;
  background-color: @background;
  text-color: @purple;
}
 
 
window {
    background-color:               @background;
    border:                         2px;
    border-color:                   @line;
    border-radius:                  50px;
    width:                          490px;   
    height:                         130px;          
    x-offset:                       -4;
    y-offset:                       0;
}
 
listview {
    background-color:               @background;
    columns:                        1;
    lines:                          5;
    spacing:                        50px;
    layout:                         horizontal;
}
 
mainbox {
    background-color:               @background;
    children:                       [ listview ];
    padding:                        40px;
}
 
element {
    background-color:               @background;
    text-color:                     @line;
    orientation:                    horizontal;
    /*border-radius:                  100%;*/
    /*padding:                        8px 32px 8px 32px;*/
}
 
element-text {
    background-color:               inherit;
    text-color:                     inherit;
    font:                           "Font Awesome 6 Free 30";
    expand:                         false;
    horizontal-align:               0.5;
    vertical-align:                 0.5;
    margin:                         0px;
}
 
element selected {
    background-color:               @background;
    text-color:                     @purple;
    border:                         0px;
    /*border-radius:                  100%;*/
    border-color:                   @selected;
}
 
 
 
 