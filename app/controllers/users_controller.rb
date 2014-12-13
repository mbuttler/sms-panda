class UsersController < ApplicationController
  before_filter :authenticate,  :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user,  :only => [:edit, :show, :update]
  before_filter :admin_user,    :only => :destroy
  before_filter :skip_password_attribute, only: :update

  def index
    @title = "All Pandas"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    
    @message = Message.new
    @announce = Announce.new

    @contacts = @user.contacts.paginate(:page => params[:page])
    @messages = @user.messages.paginate(:page => params[:page])
    @title = @user.name
    @twurl  = "http://alex:sms-panda@zzv.ca:8080/messagesincoming/" + @user.id.to_s + "/" + @user.salty_route.to_s

    @balance = 0.0
    @charges = 0.0
    @credits = 0.0

    if Billing.find_by_user_id(params[:id]) 
      puts "non nil?"
      @balance = Billing.find_by_user_id(params[:id]).balance
      @charges = Billing.find_by_user_id(params[:id]).charges
      @credits = Billing.find_by_user_id(params[:id]).credits
    end
  end

  def new
    @user = User.new
  	@title = "Sign up"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      if Rails.env.production?
        UserMailer.signup_confirmation(@user).deliver
      end
      flash[:success] = "Welcome to the SMS Panda"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit Panda"
  end

  def update
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user 
    else
      @title = "Edit Panda"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Panda destroyed. Sorry China. (No actual Pandas harmed.)"
    redirect_to users_path
  end

  private
  ## Strong Params
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :sroute, :phone, :email_fwd, )
    end

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end  

    def skip_password_attribute
      if params[:password].blank? && params[:password_validation].blank?
        params.except!(:password, :password_validation)
      end
    end
end