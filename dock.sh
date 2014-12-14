#!/bin/bash

if [ ! -f Dockerfile ];
  then
  echo "No Dockerfile yet"
  cp Dockerfile.example Dockerfile
  sed -i '' "s/REPLACE_ME_NOW/$(bundle exec rake secret)/" /Users/admin/Dropbox/code/sms-panda/Dockerfile
else
  echo "We have docking!"
fi