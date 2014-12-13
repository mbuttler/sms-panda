class PhoneSuggestions
  def initialize(app)
    @app = app 
  end

  def call(env)
    if env["PATH_INFO"] == "/phone_suggestions"
      request = Rack::Request.new(env)
      #current_user isn't a thing in this space apparently . . .
      phones = PhoneSuggestion.phone_for(request.params["phone"], current_user.id)
      [200, {"Content-Type" => "application/json"}, [phones.to_json]]
    else
      @app.call(env)
    end
  end
end