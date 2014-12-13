Factory.define :user do |user|
  user.name                     "Alex M"
  user.email                    "example@atam.ca"
  user.password                 "foobarfoobar"
  user.password_confirmation    "foobarfoobar"
  user.phone                    "6136996738"
end

Factory.define :message do |message|
  message.message                   "Alex M is a a male."
  message.to                        "6133042365"
  message.from                      "6138584587"
  message.association               :user
end

Factory.define :contact do |contact|
  contact.name          "Alex Tester"
  contact.phone         "6133042365"
  contact.association   :user
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :phone do |n|
  "613699111#{n}"
end

Factory.sequence :to do |n|
  "613699222#{n}"
end

Factory.sequence :from do |n|
  "613699444#{n}"
end