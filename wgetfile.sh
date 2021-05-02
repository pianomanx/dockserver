#!/usr/bin/with-contenv bash
####################################
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
updates="update upgrade autoremove autoclean"
for upp in ${updates};do
 sudo $(command -v apt) $upp -yqq 1>/dev/null 2>&1 && clear
done
if [[ -f "/bin/dockserver" ]];then $(command -v rm) -rf /bin/dockserver;fi
if [[ ! -f "/bin/dockserver" ]];then
cat <<'EOF' > /bin/dockserver
#!/usr/bin/with-contenv bash
####################################
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
updates="update upgrade autoremove autoclean"
for upp in ${updates};do
 sudo $(command -v apt) $upp -yqq 1>/dev/null 2>&1
done
clear
if [[ ! -x $(command -v git) ]];then sudo $(command -v apt) install git -yqq;fi
##migrate from multirepo to one
old="/opt/apps /opt/gdsa /opt/traefik /opt/installer"
for i in ${old}; do
  if [[ -d "$i" ]];then $(command -v rm) -rf $i;fi
done
##migrate from multirepo to one
if [[ -d "/opt/dockserver" ]];then
    sudo $(command -v rm) -rf /opt/dockserver
    sudo git clone --quiet https://github.com/dockserver/dockserver.git /opt/dockserver
else
    sudo git clone --quiet https://github.com/dockserver/dockserver.git /opt/dockserver
fi
cd /opt/dockserver && $(command -v bash) install.sh
#EOF
EOF
  sudo $(command -v chmod) 755 /bin/dockserver
fi

tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    🚀    DockServer [ EASY MODE ]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

           to install dockserver

      type dockserver || sudo dockserver

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
         [ Press ENTER to EXIT ]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
  read -erp "↘️ Press [ENTER]: " headsection </dev/tty
  case $headsection in
      *) exit ;;
  esac
#EO
