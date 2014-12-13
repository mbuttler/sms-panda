namespace :db do 
  desc "Fill database withh sample users/pandas"
  task :populate => :environment do 
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                  :email => "example@railstutorial.org",
                  :password => "foobarfoobar",
                  :password_confirmation => "foobarfoobar")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "passwordpassword"
      User.create!(:name => name,
                    :email => email,
                    :password => password,
                    :password_confirmation => password)
    end
  end
end