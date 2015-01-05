class MessagesController < ApplicationController
  before_filter :signed_in_user,  only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_filter :correct_user,   only: [:destroy, :edit, :show, :update]
  before_filter :authenticate, :only => [ :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @title = "All Messages consumed by Panda"
    @messages = Message.all.includes(:user)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @title = "Panda Message"
    @message = Message.find(params[:id])
  end

  # GET /messages/new
  def new
    @message = Message.new
    @from = current_user.phone
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @title = "Write to a Panda"
    @message = current_user.messages.build(message_params)
    create_charge(current_user)
    Message.delay.sms_create(@message.message, @message.to.to_i, current_user.phone.to_i )

    if @message.save
      flash[:success] = "Message Created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/home'
    end
      rescue => e
        logger.warn "Unable to sms, will ignore: #{e}" 
  end

#GET /messagesicoming
  def messagesin
    user = params['id']
    submitted_salt_fragment = params['salt_fragment'].to_s
    set_user(user, submitted_salt_fragment)
    sms_body  = params['Body'] 
    sms_from  = params['From']
    sms_to    = params['To']
    @title = "PandaBot"
    @message = @user.messages.build(:message => sms_body, :phone => sms_from, :to => sms_to, :from => sms_from)

    if @message.save
      create_charge(user)
      render nothing: true,  :status => 200
    else
      @feed_items = []
      render 'pages/home'
    end

    if @user.email_fwd?
      if Rails.env.production?
        puts "Forwarding email"
        #TODO don't submit the user object, just email
        UserMailer.message_fwd(@user, sms_body).deliver
        # UserMailer.delay.message_fwd(@user, @message)
      end
    end
    rescue => e
      logger.warn "\033[0;31m Unable to sms in, will ignore: #{e} \033[0;37m" 
  end  

  # # PATCH/PUT /sms/1
  # # PATCH/PUT /sms/1.json
  def update
    
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'message was successfully destroyed.' }
      format.json { head :no_content }
    end
    # redirect_to users_path and return
    # redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message, :phone, :to, :from)
    end

    def correct_user
      @message = current_user.messages.find_by_id(params[:id])
      redirect_to root_url if @message.nil?
    end

    def set_user(id, salt_fragment)
      @user = User.new
      @user = auth_with_fragment(id, salt_fragment)
    end

    def create_charge(user_id)
      bill = Billing.find_or_create_by(user_id: user_id)
      bill_charge = bill.charges + 1
      bill_bal = bill.balance - 1 
      if bill.update_attributes(charges: bill_charge, balance: bill_bal )
        puts "paid"
      end
    end
end
