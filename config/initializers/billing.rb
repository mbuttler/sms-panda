SCHEDULER = Rufus::Scheduler.new
include MessagesHelper
include ShopifyAPI

API_KEY = ENV['SHOPIFY_AKEY'] 
PASSWORD = ENV['SHOPIFY_APASS'] 
CREDIT_ID = 1013309272 
CREDIT_AMOUNT = 500

shop_url = "https://#{API_KEY}:#{PASSWORD}@sms-panda.myshopify.com/admin"
ShopifyAPI::Base.site = shop_url

#billing
SCHEDULER.every '300s', :first_in => 2 do 
  o = Order.find(:all)
  if o.first.nil?
    puts "sleeping"
  else
    credit_paid_id = o.first.line_items.first.variant_id
    if credit_paid_id = CREDIT_ID
      puts "They paid for $5 credit id#: #{credit_paid_id} today!"
    else
      puts "No match, not paid. What did they buy? . . . This: #{o.first.line_items.first.variant_id}"
    end
   
    o_email = o.first.email
    # puts o_email
    user = User.find_by_email(o_email)
    uid = user.id
    bill = Billing.find_or_create_by(user_id: uid) 
    updatecharge = bill.balance + CREDIT_AMOUNT
    if o.first.total_price = 5.00
      if bill.update_attributes(balance: updatecharge, credits: CREDIT_AMOUNT)
        puts "bitchin'"
        o.first.close
      end
      puts user.errors.messages
    end
  end
end
