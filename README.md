# README #
[![Issue Stats](http://issuestats.com/github/amassaad/sms-panda/badge/pr)](http://issuestats.com/github/amassaad/sms-panda) 
[![Issue Stats](http://issuestats.com/github/amassaad/sms-panda/badge/issue)](http://issuestats.com/github/amassaad/sms-panda)


Welcome to the SMS Panda
[ ![Codeship Status for amassaad/sms-panda](https://codeship.com/projects/ca32a8f0-67bc-0132-4efc-3ac858f34f77/status?branch=master)](https://codeship.com/projects/53188)

### What is this repository for? ###

SMS gateway to be used with Twilio

### How do I get set up? ###

* uses Docker in production to contain all gems inside a simple container
* Twilio account . . .for now


### Contribution guidelines ###

* Test locally, Twilio is set to send GET for sms now, the new numbers default to POST.
* Generally push to your feature branch

### Who do I talk to? ###

* AMassaad

An example Twilio message request ends with
```
/messagesincoming/1/f61dbbe?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Test+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=&From=%2B16138584587&ApiVersion=2010-04-01
```
```
?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Test+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=&From=%2B16138584587&ApiVersion=2010-04-01
```
