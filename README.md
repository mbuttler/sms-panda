# README #

Welcome to the SMS Panda TODO:Fix this status  [ ![Codeship Status for massaad/sms-phone-gateway](https://codeship.io/projects/1fe7fe60-3d32-0132-b129-42c319cbceea/status)](https://codeship.io/projects/43223)

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

/messagesincoming/1/f61dbbe?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Test+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=&From=%2B16138584587&ApiVersion=2010-04-01


?ToCountry=CA&ToState=ON&SmsMessageSid=SMa1c87d031c29d882a8975d773455c107&NumMedia=0&ToCity=OTTAWA&FromZip=&SmsSid=SMa1c87d031c29d882a8975d773455c107&FromState=ON&SmsStatus=received&FromCity=OTTAWA&Body=Test+&FromCountry=CA&To=%2B16136996738&ToZip=&MessageSid=SMa1c87d031c29d882a8975d773455c107&AccountSid=&From=%2B16138584587&ApiVersion=2010-04-01
