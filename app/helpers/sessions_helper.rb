module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user_sys(id, fragment)
    @current_user ||= user_from_salt_fragment
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  # def deny_access
  #   redirect_to signin_path, :notice => "Oops, looks like you're not authenticated yet."
  # end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
   end

   def clear_return_to
     session[:return_to] = nil
   end

   def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def user_from_salt_fragment
      auth_with_fragment(:id, :fragment)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end

end
