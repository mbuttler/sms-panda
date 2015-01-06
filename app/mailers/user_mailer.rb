class UserMailer < ActionMailer::Base
  default from: "alex@atam.ca"

  def signup_confirmation(email)
    @email = email.to_s
    mail(to: @email, subject: "Confirmation of Sign Up")
  end

  def message_fwd(email, messaage)
    @email = email.to_s
    @message = message
    mail(to: @email, subject: "New SMS")
  end
end
