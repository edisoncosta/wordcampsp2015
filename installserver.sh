#!/bin/bash

echo "# Alteracao de Fuso Horario (Date)"
echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

echo "# Atualizacao de pacotes"
apt-get update -y

echo "# Instalacao de EasyEngine"
sudo echo -e "[user]\n\tname = AgiusCloud\n\temail = edison@agiuscloud.com" > ~/.gitconfig
wget -qO ee rt.cx/ee && sudo bash ee

echo "# Instalacao de Servidores"
ee stack install --nginxmainline --php --mysql --phpmyadmin --utils --postfix --wpcli --hhvm --redis

echo "# Instalacao do Composer"
cd /usr/src
curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/bin/composer

echo "# Instalacao Public Key"
mkdir ~/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhNRa2H92Z80tvlVvIJz9vo3E3Q3pyjyZa4JmHTZ8pkH3SIX9E5YrE5AL7steBbn5/u7oFz0sx4iNHO5FGWmpj0E0KAp8rB5CShLabEhw2p4Rfu6NvGB5lffASsFqgR5PBrK7xKypS+TKu/UPK0YK3MnDSMwNDyifAp5LH6qJ13n7xv5s/y6aS2et5lOhV0lIiG1Q25EzOSDitZDVa4PfhzaOg1MirCgu5FH+GFWDOP5eywacWcU8PGXwlfkwm8j8GWTiKeiTGMjWUgjYMJPiFXkfMpIysfNR49h+MrXCEE2v9+GUIJJnYghFJfdBMM7VbDk4OVwDnoOgLH3fGHk9ow== key-edisoncosta" > ~/.ssh/authorized_keys

echo "# Restart servicos"
ee stack restart





