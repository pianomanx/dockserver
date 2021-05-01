#!/usr/bin/with-contenv bash
# shellcheck shell=bash
######################################################
# Copyright (c) 2021, dockserver                     #
######################################################
# All rights reserved.                               #
# started from Zero                                  #
# Docker owned from dockserver                       #
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
#FUNCTIONS START
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
basefolder="/opt/appdata"
  if [[ ! -x $(command -v docker) ]];then exit;fi
  if [[ -f "$basefolder/GDSA/.env" ]];then $(command -v rm) -rf $basefolder/GDSA/.env;fi
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     Please wait while we pull the needed dockers
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  $(command -v docker) system prune -af 1>/dev/null 2>&1
  pulls="ghcr.io/dockserver/docker-gdsa:latest rclone/rclone gcr.io/google.com/cloudsdktool/cloud-sdk:alpine"
  for pull in ${pulls};do
     $(command -v docker) pull $pull --quiet
  done
  clear && checkfields && interface
done
}
checkfields() {
basefolder="/opt/appdata"
if [[ ! -d "$basefolder/GDSA/" ]];then $(command -v mkdir) -p $basefolder/GDSA/;fi
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
projectname() {
basefolder="/opt/appdata"
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   Project Name
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
   read -erp "Enter your Projectname: " PROJECTNAME </dev/tty
if [[ $PROJECTNAME != "" ]];then
   if [[ $(uname) == "Darwin" ]];then
      sed -i '' "s/PROJECT=NOT-SET/PROJECT=$PROJECTNAME/g" $basefolder/GDSA/.env
   else
      sed -i "s/PROJECT=NOT-SET/PROJECT=$PROJECTNAME/g" $basefolder/GDSA/.env
   fi
else
  echo "Project name cannot be empty"
  projectname
fi
clear && interface
}
sabasename() {
basefolder="/opt/appdata"
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   Service Account Base Name
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
   read -erp "Enter your Service Account Base Name: " SABASENAME </dev/tty
if [[ $SABASENAME != "" ]];then
   if [[ $(uname) == "Darwin" ]];then
      sed -i '' "s/PROJECTNAME=NOT-SET/PROJECTNAME=$SABASENAME/g" $basefolder/GDSA/.env
   else
      sed -i "s/PROJECTNAME=NOT-SET/PROJECTNAME=$SABASENAME/g" $basefolder/GDSA/.env
   fi
else
  echo " Service Account Base name cannot be empty"
  sabasename
fi
clear && interface
}
account() {
basefolder="/opt/appdata"
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   Account Name
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
   read -erp "Enter your Account Email: " ACCOUNTNAME </dev/tty
if [[ $ACCOUNTNAME != "" ]];then
   if [[ $(uname) == "Darwin" ]];then
      sed -i '' "s/ACCOUNT=NOT-SET/ACCOUNT=$ACCOUNTNAME/g" $basefolder/GDSA/.env
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   Validate your Google Authentication
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
      $(command -v docker) run -ti --name gcloud-config gcr.io/google.com/cloudsdktool/cloud-sdk:alpine gcloud auth login --no-launch-browser --account=${ACCOUNTNAME}
   else
      sed -i "s/ACCOUNT=NOT-SET/ACCOUNT=$ACCOUNTNAME/g" $basefolder/GDSA/.env
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   Validate your Google Authentication
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
      $(command -v docker) run -ti --name gcloud-config gcr.io/google.com/cloudsdktool/cloud-sdk:alpine gcloud auth login --no-launch-browser --account=${ACCOUNTNAME}
   fi
else
  echo "Account name cannot be empty"
  account
fi
clear && interface
}
teamdriveid() {
basefolder="/opt/appdata"
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   Team Drive ID
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
   read -erp "Enter your Team Drive ID: " TEAMDRVEID </dev/tty
if [[ $TEAMDRVEID != "" ]];then
   if [[ $(uname) == "Darwin" ]];then
      sed -i '' "s/TEAMDRIVEID=NOT-SET/TEAMDRIVEID=$TEAMDRVEID/g" $basefolder/GDSA/.env
   else
      sed -i "s/TEAMDRIVEID=NOT-SET/TEAMDRIVEID=$TEAMDRVEID/g" $basefolder/GDSA/.env
   fi
else
  echo "Team Drive ID name cannot be empty"
  teamdriveid
fi
clear && interface
}
gdsanumber() {
basefolder="/opt/appdata"
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   GDSA Keys 
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
   read -erp '↘️  Type a Number [ 4 thru 60 ] | Press [ENTER]: ' KEYS </dev/tty
  if [[ $KEYS -le "3" || $KEYS -ge "60" ]];then 
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   Sorry $KEYS is more then 60 or less than 3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
sleep 5 && gdsanumber
fi
  if [[ $KEYS -ge "3" || $KEYS -le "60" ]];then 
     if [[ $(uname) == "Darwin" ]];then
        sed -i '' "s/NUMGDSAS=NOT-SET/NUMGDSAS=$KEYS/g" $basefolder/GDSA/.env
     else
        sed -i "s/NUMGDSAS=NOT-SET/NUMGDSAS=$KEYS/g" $basefolder/GDSA/.env
     fi
  fi
clear && interface
}
validauth() {
basefolder="/opt/appdata"
ACCOUNT=${ACCOUNT}
source $basefolder/GDSA/.env
if [[ -d "$basefolder/GDSA/keys" ]];then $(command -v rm) -rf $basefolder/GDSA/keys;fi
if [[ ! -d "$basefolder/GDSA/keys" ]];then $(command -v mkdir) -p $basefolder/GDSA/keys;fi
if [[ ${ACCOUNT} != "NOT-SET" ]];then
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   GDSA Builder running now
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

$(command -v docker) run --rm --volumes-from gcloud-config -v /opt/appdata/GDSA:/GDSA:rw ghcr.io/dockserver/docker-gdsa:latest 1>/dev/null 2>&1

sleep 5 && clear 
members=$(cat $basefolder/GDSA/members.csv)
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   SYSTEM MESSAGE: Key Generation Complete!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

${members}

    Shortcut to Google Team Drives 
    Share the E-Mails with the CORRECT TEAMDRIVE: ${TEAMDRIVEID}
    SAVE TIME! Copy & Paste the all the E-Mails into the share!

     Type confirm ! when all is done !
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  read -erp "Confirm Info | PRESS [ENTER] " input </dev/tty
  if [[ "$input" = "confirm" ]];then sleep 2 && clear && checkfields && interface;fi
else
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    ❌ ERROR 
    Account is ${ACCOUNT}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
sleep 10 && clear && interface
fi
}
interface() {
source $basefolder/GDSA/.env
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀   GDSA Builder || UNENCRYPTED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    [ 1 ] Account Details            [ ${ACCOUNT} ]
    [ 2 ] Basename of the Project    [ ${PROJECTNAME} ]
    [ 3 ] Project name               [ ${PROJECT} ]
    [ 4 ] Team Drive ID              [ ${TEAMDRIVEID} ]
    [ 5 ] Numbers of GDSA Keys       [ ${NUMGDSAS} ]
	
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    [ D ] Deploy UNENCRYPTED Keys

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    [ EXIT or Z ] - Exit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  read -erp "↘️  Type Number and Press [ENTER]: " headsectionun </dev/tty
  case $headsectionun in
    1) clear && account ;;
    2) clear && sabasename ;;
    3) clear && projectname ;;
    4) clear && teamdriveid ;;
    5) clear && gdsanumber ;;
    d|D) clear && validauth ;;
    Z|z|exit|EXIT|Exit|close) clear && exit ;;
    *) appstartup ;;
  esac
}
appstartup
#EOF
