#!/bin/bash

mkdir -p /home/ubuntu/current
sudo chmod -R 757 /home/ubuntu/current
cd /home/ubuntu/current
pwd
sudo apt-get update
sudo apt-get -y install git
git clone https://github.com/ATAMProductions/sms-panda.git
sudo curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` >  /usr/local/bin/fig'
sudo chmod +x /usr/local/bin/fig
cd /home/ubuntu/current/sms-panda
sudo fig build
sudo fig run web rake db:create
sudo fig run web rake db:migrate
sudo fig up -d