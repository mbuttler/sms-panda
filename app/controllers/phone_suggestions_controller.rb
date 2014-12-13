class PhoneSuggestionsController < ApplicationController
  def index
    render json: PhoneSuggestion.phone_for(params[:phone], current_user.id)
  end
end
