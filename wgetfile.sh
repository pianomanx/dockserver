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
if [[ ! -d "/opt/dockserver/" ]] ;then 
if [[ -d "/opt/dockserver/installer" ]];then  sudo $(command -v mkdir) -p /opt/dockserver/;fi
    sudo $(command -v rm) -rf /opt/dockserver/installer 
    sudo git clone --quiet https://github.com/dockserver/installer.git /opt/dockserver/installer
fi
if [[ ! -d "/opt/dockserver/installer" ]]; then
    sudo git clone --quiet https://github.com/dockserver/installer.git /opt/dockserver/installer
fi
cd /opt/dockserver/installer && $(command -v bash) install.sh
