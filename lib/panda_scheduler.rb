require 'rufus-scheduler'

# SEARCH_SCHEDULER = Rufus::Scheduler.new

# SEARCH_SCHEDULER.every '900s', :first_in => 0 do
#   PhoneSuggestion.destroy_all
#   PhoneSuggestion.index_phones
# end
class PandaScheduler
  def initialize(options = {})
    @rufus_scheduler = Rufus::Scheduler.new(options)
  end

  def stop 
    @rufus_scheduler.stop
  end

  def run!
    @rufus_scheduler.every '1m' do 
      PhoneSuggestion.destroy_all
      PhoneSuggestion.index_phones
    end
  end
end