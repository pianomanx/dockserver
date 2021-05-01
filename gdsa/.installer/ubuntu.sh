#!/usr/bin/with-contenv bash
# shellcheck shell=bash
######################################################
# Copyright (c) 2021, dockserver                         #
######################################################
# All rights reserved.                               #
# started from Zero                                  #
# Docker owned from dockserver                           #
# some codeparts are copyed from sagen from 88lex    #
# sagen is under MIT License                         #
# Copyright (c) 2019 88lex                           #
#                                                    #
# CREDITS: The scripts and methods are based on      #
# ideas/code/tools from ncw, max, sk, rxwatcher,     #
# l3uddz, zenjabba, dashlt, mc2squared, storm,       #
# physk , plexguide and all missed once              #
######################################################
# shellcheck disable=SC2003
# shellcheck disable=SC2006
# shellcheck disable=SC2207
# shellcheck disable=SC2012
# shellcheck disable=SC2086
# shellcheck disable=SC2196
# shellcheck disable=SC2046
# shellcheck disable=SC1091
appstartup() {
if [[ $EUID -ne 0 ]];then
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔  You must execute as a SUDO user (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
exit
fi
while true; do
  if [[ ! -x $(command -v docker) ]];then exit;fi
  clear && checkfields && interface
done
}
checkfields() {
basefolder="/opt/appdata"
if [[ ! -d "$basefolder/GDSA/" ]];then $(command -v mkdir) -p $basefolder/GDSA/;fi
if [[ ! -d "$basefolder/GDSA/keys" ]];then $(command -v mkdir) -p $basefolder/GDSA/keys;fi
if [[ ! -f "$basefolder/GDSA/.env" ]];then 
echo -n "\
#!/usr/bin/with-contenv bash
# shellcheck shell=bash
#####################################################################
# Copyright (c) 2021, dockserver                                    #
#####################################################################
# All rights reserved.                                              #
# started from Zero                                                 #
# Docker owned from dockserver                                      #
# some codeparts are copyed from sagen from 88lex                   #
# sagen is under MIT License                                        #
# Copyright (c) 2019 88lex                                          #
#####################################################################
CYCLEDELAY=0.1s
PROJECTNAME=${PROJECTNAME:-NOT-SET}
FIRSTGDSA=1
LASTPROJECTNUM=1
NUMGDSAS=${NUMGDSAS:-NOT-SET}
PROGNAME=${PROGNAME:-NOT-SET}
SECTION_DELAY=5
#### USER VALUES ####
ACCOUNT=${ACCOUNT:-NOT-SET}
PROJECT=${PROJECT:-NOT-SET}
TEAMDRIVEID=${TEAMDRIVEID:-NOT-SET}
ENCRYPT=${ENCRYPT:-FALSE}
PASSWORD=${PASSWORD:-FALSE}
SALT=${SALTPASSWORD:-FALSE}" >$basefolder/GDSA/.env
fi
}
forcereset() {
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   GDSA.env force reset
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    [ R ] Remove GDSA.env File

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    [ EXIT or Z ] - Exit || [ help or HELP ] - Help
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  read -erp "↘️  Type R|r and Press [ENTER]: " headsectionforce </dev/tty
  case $headsectionforce in
    R|r|remove|y|Y) clear && remove ;;
    help|HELP|Help) clear && LOCATION=help && selection ;;
    Z|z|exit|EXIT|Exit|close) clear && interface ;;
    *) appstartup ;;
  esac
}
remove() {
basefolder="/opt/appdata"
if [[ -f "$basefolder/GDSA/.env" ]];then 
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   GDSA.env force reset
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    We removed now the GDSA.env File || Force reset

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
$(command -v rm) -rf $basefolder/GDSA/.env && sleep 5 && clear && checkfields && interface
else 
   nofound
fi
}
nofound() {
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   GDSA.env force reset
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Sorry we could not find the file. 
    No force reset was done now !

    Type confirm !

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  read -erp "Confirm Info | PRESS [ENTER] " input </dev/tty
  if [[ "$input" = "confirm" ]];then sleep 4 && clear && checkfields && interface; else nofound;fi
}
selection() {
LOCATION=${LOCATION}
case $(. /etc/os-release && echo "$ID") in
    ubuntu)     type="ubuntu" ;;
    debian)     type="ubuntu" ;;
    rasbian)    type="ubuntu" ;;
    *)          type='' ;;
esac
if [[ -f ./.installer/.${LOCATION}/$type.${LOCATION}.sh ]];then bash ./.installer/.${LOCATION}/$type.${LOCATION}.sh;fi
}
interface() {
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   GDSA Head Section Menu
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    [ 1 ] GDSA Builder       || UNENCRYPTED
    [ 2 ] GDSA Builder       || ENCRYPTED
    [ 3 ] Remove GDSA.env    || force reset

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    [ EXIT or Z ] - Exit || [ help or HELP ] - Help
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  read -erp "↘️  Type Number and Press [ENTER]: " headsection </dev/tty
  case $headsection in
    1) clear && LOCATION=case1 && selection ;;
    2) clear && LOCATION=case2 && selection;;
    3) clear && forcereset ;;
    help|HELP|Help) clear && LOCATION=help && selection ;;
    Z|z|exit|EXIT|Exit|close) exit ;;
    *) appstartup ;;
  esac
}
appstartup
#EO
