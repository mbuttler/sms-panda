class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include ContactsHelper
  include UsersHelper
  include MessagesHelper
  name = ENV['AUTH_USER']
  pass = ENV['AUTH_PASS']
  
  unless Rails.env.test?
    http_basic_authenticate_with name: name, password: pass
    unless Rails.env.development?
      force_ssl
    end
  end
end
