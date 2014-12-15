class Message < ActiveRecord::Base
  attr_accessible :message, :phone, :user_id, :to, :from, :balance, :charges
	# has_one :contact
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :message, :presence => true, length: { maximum: 600 }
  # validates :contact_id, :presence => true, on: :update
  validates :user_id, :presence => true
  validates :to, :presence => true
  validates :from, :presence => true

  def self.sms_create(body, to, from)
    if Rails.env.production?
      account_sid = ENV['TSID']
      auth_token = ENV['TTOKEN']
      client = Twilio::REST::Client.new account_sid, auth_token
      client.account.messages.create(
        :body => body,
        :to => to,
        :from => from
      )
    elsif Rails.env.development?
      puts "I'm sms create in development mode. Body: #{body}"
    else 
      puts "I'm an SMS in I-dont-know-lol or test mode"
    end
    rescue => e
      logger.warn "Unable to sms, will ignore: #{e}" 
  end
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  contact_id :integer
#  phone      :decimal(, )
#  to         :decimal(, )
#  from       :decimal(, )
#
# Indexes
#
#  index_messages_on_user_id_and_created_at  (user_id,created_at)
#
