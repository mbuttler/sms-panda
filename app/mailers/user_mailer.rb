class UserMailer < ActionMailer::Base
  default from: "alex@atam.ca"

  def signup_confirmation(email)
    @email = user.email
    mail(to: @email, subject: "Confirmation of Sign Up")
  end

  def message_fwd(email, messaage)
    @email = user.email
    @message = message
    mail(to: @email, subject: "New SMS")
  end
end
