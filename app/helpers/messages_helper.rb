module MessagesHelper

  def sms_create(body, to, from)
    if not Rails.env.production?
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
