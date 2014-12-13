namespace :phone_suggestions do
  desc "Generate phone suggestions from contacts"
  task :index => :environment do
    puts "Clearning out the trashy suggestions"
    PhoneSuggestion.destroy_all
    puts "Finished, now to index new phones"
    PhoneSuggestion.index_phones
    puts "Finished again!"
  end
end