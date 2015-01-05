class UserMailer < ActionMailer::Base
  default from: "alex@atam.ca"
  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Confirmation of Sign Up"
  end

  def message_fwd(user, messaage)
    @user = user
    @message = message
    mail to: user.email, subject: "New SMS from #{@message}"
  end
end
