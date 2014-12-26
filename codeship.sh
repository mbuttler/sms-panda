#!/bin/bash
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` >  /usr/local/bin/fig
chmod +x /usr/local/bin/fig
sudo apt-get update && sudo apt-get install docker.io
cd /home/ubuntu/current/
fig build
fig run web rake db:create
fig run web rake db:migrate
fig up -d

##now
ssh ubuntu@ec2-54-68-131-69.us-west-2.compute.amazonaws.com 'mkdir -p /home/ubuntu/current'
rsync -av ~/clone/* ubuntu@ec2-54-68-131-69.us-west-2.compute.amazonaws.com:/home/ubuntu/current
ssh ubuntu@ec2-54-68-131-69.us-west-2.compute.amazonaws.com 'cd /home/ubuntu/current/ && sudo fig build && sudo fig run web rake db:create && sudo fig run web rake db:migrate && sudo fig up -d'


## first
ssh -i ~/Dropbox/panda.pem ubuntu@ec2-54-68-131-69.us-west-2.compute.amazonaws.com 
#to say yes
ssh -i ~/Dropbox/panda.pem ubuntu@ec2-54-68-131-69.us-west-2.compute.amazonaws.com 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChxkAC1UEYMcF9ptGQeeERQi1LFfoRivuBeybyQ2vrYbbeSXIYAafC0Bgo76x2veFTsmoQMYFw6yVIrAIpnlgp2acLU0cTA5M197upKYJsO83TWhDN4BfteB0yEMhj0Q9gg5F+D1LLZnSsTByiXugcO2ccunp8/M4aUiERBs95T9EliGQiGFjGkK/AIo2RajUHLve2Vj91y4J6iLK3A/DwlO+QRB6uh2vn4xpKV95WpJRerBsWSAZCDZIdmO7KaFPmcJkY5SvlJM50ZP//NPwmqTaEKyo1WFXxBJh9AAKMcNCxHDadEYMgCyP01d8XlWo3wh64jjqonXlcDFMW3o+1 Codeship/amassaad/sms-panda" >> ~/.ssh/authorized_keys'
sudo -i 
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` >  /usr/local/bin/fig && chmod +x /usr/local/bin/fig && apt-get -y update && apt-get -y install docker.io