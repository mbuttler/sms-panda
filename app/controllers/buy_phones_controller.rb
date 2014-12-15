class BuyPhonesController < ApplicationController
  before_filter :signed_in_user,  only: [ :search_options, :search_numbers, :buy_number ]
  # before_filter :correct_user,   :only => [ :search_options, :buy_number ]
  account_sid = ENV['TSID']
  auth_token = ENV['TTOKEN']

  def search_numbers
  end

  def search_options
   

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
    account_sid2 = 'AC4733b723110b38ed143ca6decd54906d' 
    auth_token2 = 'bdff073e11bd0dd597e901e7052be4e4'

    client = Twilio::REST::Client.new(account_sid2, auth_token2)

    number = client.account.incoming_phone_numbers.create(
                   :phone_number => params[:PhoneNumber])

    @user = current_user
    # @user.phone = @number
    create_charge(current_user.id)
    @user.update_column(:phone, number.phone_number.to_i)

    redirect_to current_user
    rescue StandardError => e
      logger.warn "Unable to buy , error logged was: #{e}" 
      redirect_to current_user
  end

  # # GET /buy_phones
  # # GET /buy_phones.json
  # def index
  #   @buy_phones = BuyPhone.all
  # end

  # # GET /buy_phones/1
  # # GET /buy_phones/1.json
  # def show
  # end

  # # GET /buy_phones/new
  # def new
  #   @buy_phone = BuyPhone.new
  # end

  # # GET /buy_phones/1/edit
  # def edit
  # end

  # # POST /buy_phones
  # # POST /buy_phones.json
  # def create
  #   @buy_phone = BuyPhone.new(buy_phone_params)

  #   respond_to do |format|
  #     if @buy_phone.save
  #       format.html { redirect_to @buy_phone, notice: 'Buy phone was successfully created.' }
  #       format.json { render :show, status: :created, location: @buy_phone }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @buy_phone.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /buy_phones/1
  # # PATCH/PUT /buy_phones/1.json
  # def update
  #   respond_to do |format|
  #     if @buy_phone.update(buy_phone_params)
  #       format.html { redirect_to @buy_phone, notice: 'Buy phone was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @buy_phone }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @buy_phone.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /buy_phones/1
  # # DELETE /buy_phones/1.json
  # def destroy
  #   @buy_phone.destroy
  #   respond_to do |format|
  #     format.html { redirect_to buy_phones_url, notice: 'Buy phone was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_phone
      @buy_phone = BuyPhone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_phone_params
      params[:buy_phone]
    end

    def create_charge(user_id)
      bill = Billing.find_or_create_by(user_id: user_id)
      bill_charge = bill.charges + 100
      bill_bal = bill.balance - 100 
      if bill.update_attributes(charges: bill_charge, balance: bill_bal )
        puts "paid"
      end
    end
end
