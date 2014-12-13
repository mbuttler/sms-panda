class PagesController < ApplicationController
  def home
  	@title = "Home"
    if signed_in?
      expire_fragment("message")
      @message = Message.new
      @feed_items = current_user.feed.paginate(:page => params[:page]).includes(:user)
    end
  end

  def about
  	@title = "About"
  end

  def contactus
  	@title = "Contact Us"
  end
end
