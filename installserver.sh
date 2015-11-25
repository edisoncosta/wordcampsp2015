#!/bin/bash

# Alteracao de Fuso Horario (Date)
echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Atualizacao de pacotes
apt-get update -y

# Instalacao de EasyEngine
sudo echo -e "[user]\n\tname = AgiusCloud\n\temail = edison$agiuscloud.com" > ~/.gitconfig
wget -qO ee rt.cx/ee && sudo bash ee

# Instalacao de Servidores
ee stack install --nginx --php --mysql --phpmyadmin --utils --postfix --wpcli --hhvm --redis






