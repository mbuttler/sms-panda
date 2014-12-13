# README #

Welcome to the SMS Panda [ ![Codeship Status for massaad/sms-phone-gateway](https://codeship.io/projects/1fe7fe60-3d32-0132-b129-42c319cbceea/status)](https://codeship.io/projects/43223)

### What is this repository for? ###

SMS gateway at [https://lit-falls-9948.herokuapp.com/pages/home](https://lit-falls-9948.herokuapp.com/pages/home)

### How do I get set up? ###

* gem 'rails'
* gem 'twilio-ruby'
* gem 'mail'
* bundle install-izzle
* heroku deployment via codeship.io > just push a passing branch and make a PR before you merge to master
* Twilio account . . .for now


### Contribution guidelines ###

* Test locally, Twilio is set to send GET for sms now
* Generally push to your feature branch

### Who do I talk to? ###

* Massaad

An example Twilio message request ends with

?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Boo+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=AC4474fb44063b4118e729013bd9e9a5dd&From=%2B16138584587&ApiVersion=2010-04-01

or

/messagesincoming/1/de63ded?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Boo+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=AC4474fb44063b4118e729013bd9e9a5dd&From=%2B16138584587&ApiVersion=2010-04-01

Latest, to my number (incomming)

/messagesincoming/1/f61dbbe?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Test+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=AC4474fb44063b4118e729013bd9e9a5dd&From=%2B16138584587&ApiVersion=2010-04-01


?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Test+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=AC4474fb44063b4118e729013bd9e9a5dd&From=%2B16138584587&ApiVersion=2010-04-01

https://alex:sms-panda@sms-panda.herokuapp.com
