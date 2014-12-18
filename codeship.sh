#!/bin/bash
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` >  /usr/local/bin/fig
chmod +x /usr/local/bin/fig
sudo apt-get update && sudo apt-get install docker.io
cd /home/ubuntu/current/sms-panda
fig build
fig run web rake db:create
fig run web rake db:migrate
fig up -d

##now
ssh ubuntu@host.com 'mkdir -p /home/ubuntu/current'
scp -rp ~/clone/* ubuntu@host.com:/home/ubuntu/current
ssh ubuntu@host.com 'sudo curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` >  /usr/local/bin/fig && chmod +x /usr/local/bin/fig && cd /home/ubuntu/current/sms-panda && fig build && fig run web rake db:create && fig run web rake db:migrate && fig up -d'