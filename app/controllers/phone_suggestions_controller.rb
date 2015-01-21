class PhoneSuggestionsController < ApplicationController
  def index
    render json: PhoneSuggestion.phone_for(params[:term].to_s, current_user.id)
  end
end
