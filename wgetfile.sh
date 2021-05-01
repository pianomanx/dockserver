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

sudo $(command -v apt) update -yqq && sudo $(command -v apt) upgrade -yqq
if [[ ! -x $(command -v git) ]];then sudo $(command -v apt) install git -yqq;fi
if [[ -d "/opt/dockserver" ]];then
    sudo $(command -v rm) -rf /opt/dockserver
    sudo git clone --quiet https://github.com/dockserver/onerepo.git /opt/dockserver
if [[ ! -d "/opt/dockserver" ]];then
    sudo git clone --quiet https://github.com/dockserver/dockserver.git /opt/dockserver
fi
cd /opt/installer && $(command -v bash) install.sh
