class AnnouncesController < ApplicationController
  
  before_filter :admin_user,    only: [:create, :destroy]

  def index
    @title = "All Messages consumed by Panda"
    @announces = Announce.all
  end

  # GET /announces/1
  # GET /announces/1.json
  def show
    @title = "Panda announce"
    @announce = announce.find(params[:id])
  end

  # GET /announces/new
  def new
    @announce = Announce.new
  end

  def create
    @announce = Announce.create( message: params[:announce][:message],  starts_at: Time.zone.now, ends_at: 7.days.from_now ) 
    @announce.save
    redirect_to current_user
    # @announce.save
    # @user.messages.build(:message => sms_body, :phone => sms_from, :to => sms_to, :from => sms_from)
    # Announce.create! message: "The site will be down for maintenance tonight between 10:00 and 11:00 PM GMT", starts_at: Time.zone.now, ends_at: 7.days.from_now
  end

  def hide
    ids = [params[:id], *cookies.signed[:hidden_announce_ids]]
    cookies.permanent.signed[:hidden_announce_ids] = ids
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    Announce.find(params[:id]).destroy
    flash[:success] = "Announecment destroyed. Sorry . (No actual Pandas harmed.)"
    redirect_to announces_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def announce_params
      params.require(:announce).permit(:message, :starts_at, :ends_at)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end