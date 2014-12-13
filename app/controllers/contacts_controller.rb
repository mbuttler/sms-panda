class ContactsController < ApplicationController
  before_action :set_contact,     only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_user,  only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_filter :correct_user,    only: [:show, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @title = "All Pandas"
    @contacts = Contact.where(user_id: current_user.id).paginate(:page => params[:page])
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    # @messages = @contact.messages.paginate(:page => params[:page])
    # @user = User.find(user_params)
    @title = @contact.name
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @title = "Sign up"
  end

  # GET /contacts/1/edit
  def edit
    @title = "Edit contact"
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @title = "Save another Panda's number"
    # @contact = Contact.new(contact_params)

    @contact = current_user.contacts.build(contact_params)

     if @contact.save
      flash[:success] = "Panda Friend Created!"
      redirect_to contacts_url
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
    # redirect_to contacts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:phone, :name)
    end

    def correct_user
      @contact = current_user.contacts.find_by_id(params[:id])
      redirect_to(root_path) if @contact.nil?
    end
end
