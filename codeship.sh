#!/bin/bash
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` >  /usr/local/bin/fig
chmod +x /usr/local/bin/fig
cd /home/ubuntu/current/sms-panda
fig build
fig run web rake db:create
fig run web rake db:migrate
fig up -d
