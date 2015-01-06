class BuyPhonesController < ApplicationController
  before_filter :signed_in_user,  only: [ :search_options, :search_numbers, :buy_number ]
  # before_filter :correct_user,   :only => [ :search_options, :buy_number ]

  error = "https://sms-email-gateway.herokuapp.com/smsin"

  def search_numbers
  end

  def search_options
    account_sid = ENV['TSID']
    auth_token = ENV['TTOKEN']

    client = Twilio::REST::Client.new(account_sid, auth_token)

    search_params = {}
    %w[in_postal_code near_number contains].each do |p|
      search_params[p] = params[p] unless params[p].nil? || params[p].empty?
    end
      local_numbers = client.account.available_phone_numbers.get('CA').local
      @numbers = local_numbers.list(search_params)
    rescue StandardError => e
      logger.warn "Unable to search , error logged was: #{e}" 
      redirect_to current_user
  end

  def buy_number
    account_sid = ENV['TSID']
    auth_token = ENV['TTOKEN']

    client = Twilio::REST::Client.new(account_sid, auth_token)

    number = client.account.incoming_phone_numbers.create( :phone_number => params[:PhoneNumber])

    @user = current_user
    twurl  = "http://alex:sms-panda@zzv.ca:8080/messagesincoming/" + @user.id.to_s + "/" + @user.salty_route.to_s
    number.update(:sms_url => twurl, :sms_fallback_url => error, :sms_method => 'GET', :friendly_name => @user.email )
    # @user.phone = @number
    create_charge(current_user.id)
    @user.update_column(:phone, number.phone_number.to_i)

    redirect_to current_user
    rescue StandardError => e
      logger.warn "Unable to buy , error logged was: #{e}" 
      redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def create_charge(user_id)
      bill = Billing.find_or_create_by(user_id: user_id)
      bill_charge = bill.charges + 100
      bill_bal = bill.balance - 100 
      if bill.update_attributes(charges: bill_charge, balance: bill_bal )
        logger.warn  "paid"
      end
    end
end
