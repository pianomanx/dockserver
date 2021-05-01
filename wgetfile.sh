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

sudo $(command -v apt) update -yqq && sudo $(command -v apt) upgrade -yqq

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
