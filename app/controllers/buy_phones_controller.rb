class BuyPhonesController < ApplicationController
  before_action :set_buy_phone, only: [:show, :edit, :update, :destroy]

  def search_numbers

  end

  # GET /buy_phones
  # GET /buy_phones.json
  def index
    @buy_phones = BuyPhone.all
  end

  # GET /buy_phones/1
  # GET /buy_phones/1.json
  def show
  end

  # GET /buy_phones/new
  def new
    @buy_phone = BuyPhone.new
  end

  # GET /buy_phones/1/edit
  def edit
  end

  # POST /buy_phones
  # POST /buy_phones.json
  def create
    @buy_phone = BuyPhone.new(buy_phone_params)

    respond_to do |format|
      if @buy_phone.save
        format.html { redirect_to @buy_phone, notice: 'Buy phone was successfully created.' }
        format.json { render :show, status: :created, location: @buy_phone }
      else
        format.html { render :new }
        format.json { render json: @buy_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buy_phones/1
  # PATCH/PUT /buy_phones/1.json
  def update
    respond_to do |format|
      if @buy_phone.update(buy_phone_params)
        format.html { redirect_to @buy_phone, notice: 'Buy phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy_phone }
      else
        format.html { render :edit }
        format.json { render json: @buy_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_phones/1
  # DELETE /buy_phones/1.json
  def destroy
    @buy_phone.destroy
    respond_to do |format|
      format.html { redirect_to buy_phones_url, notice: 'Buy phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_phone
      @buy_phone = BuyPhone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_phone_params
      params[:buy_phone]
    end
end
