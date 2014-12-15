namespace :db do
  desc "Fill database with test users"
  task :test_populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Burlinius Pandufson",
                 :email => "ieee1394+pandatest@gmail.com",
                 :phone => 6132225555.0,
                 :admin => true,
                 :password => "passwordpandapass",
                 :password_confirmation => "passwordpandapass")
    2.times do |n|
      name  = Faker::Name.name
      email = "ieee1394+pandatest#{n+1}@gmail.com"
      password  = "passwordpandapass"
      phone = "613304222#{n+1}"
      User.create!(:name => name,
                   :email => email,
                   :phone => phone,
                   :admin => false,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end


