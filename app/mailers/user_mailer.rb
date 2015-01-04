class UserMailer < ActionMailer::Base
  default from: noreply@sms-panda.herokuapp.com
  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Confirmation of Sign Up"
  end

  def message_fwd(user, messaage)
    @user = user
    @message = message
    mail to: user.email, subject: "New SMS from #{@message.from}"
  end
end
