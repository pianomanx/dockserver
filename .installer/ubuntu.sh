#!/usr/bin/with-contenv bash
# shellcheck shell=bash
#####################################
# All rights reserved.              #
# started from Zero                 #
# Docker owned dockserver           #
# Docker Maintainer dockserver      #
#####################################
#####################################
# THIS DOCKER IS UNDER LICENSE      #
# NO CUSTOMIZING IS ALLOWED         #
# NO REBRANDING IS ALLOWED          #
# NO CODE MIRRORING IS ALLOWED      #
#####################################
# shellcheck disable=SC2086
# shellcheck disable=SC2006
appstartup() {
if [[ $EUID -ne 0 ]];then
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔  You must execute as a SUDO user (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
exit 0
fi
while true; do
  $(command -v apt) update -yqq && $(command -v apt) upgrade -yqq
  # if [[ ! -x $(command -v git) ]];then sudo $(command -v apt) install git -yqq;fi
  # if [[ -d "/opt/dockserver/traefik " ]];then $(command -v rm) -rf /opt/dockserver/traefik;fi
  # if [[ ! -d "/opt/dockserver/traefik" ]];then sudo git clone --quiet https://github.com/dockserver/traefik.git /opt/dockserver/traefik;fi
  # if [[ -d "/opt/dockserver/apps" ]];then $(command -v rm) -rf /opt/dockserver/apps;fi
  # if [[ ! -d "/opt/dockserver/apps" ]];then sudo git clone --quiet https://github.com/dockserver/apps.git /opt/dockserver/apps;fi
  # if [[ -d "/opt/dockserver/gdsa" ]];then $(command -v rm) -rf /opt/dockserver/gdsa;fi
  # if [[ ! -d "/opt/dockserver/gdsa" ]];then sudo git clone --quiet https://github.com/dockserver/gdsa.git /opt/dockserver/gdsa;fi  
  clear && headinterface
done
}
traefik() {
cd /opt/dockserver/traefik && $(command -v bash) install.sh
}
traefikapp() {
cd /opt/dockserver/apps && $(command -v bash) install.sh
}
gdsabuilder() {
cd /opt/dockserver/gdsa && $(command -v bash) install.sh
}
headinterface() {
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀 DockServer Head Installer [ EASY MODE ]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    [ 1 ] DockServer - Traefik + Authelia
    [ 2 ] DockServer - Apps
    [ 3 ] DockServer - GDSA Builder

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    [ EXIT or Z ] - Exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

  read -erp "↘️  Type Number and Press [ENTER]: " headsection </dev/tty
  case $headsection in
    1) clear && traefik ;;
    2) clear && traefikapp ;;
    3) clear && gdsabuilder ;;
    #help|HELP|Help) clear && sectionhelplayout ;;
    Z|z|exit|EXIT|Exit|close) exit ;;
    *) clear && appstartup ;;
  esac
}
##########
appstartup
