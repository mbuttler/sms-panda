# require "rails_helper"

# RSpec.describe UserMailer, :type => :mailer do
#   describe "signup_confirmation" do

#     # before(:each) do
#     #   user = Factory(:user)
#     #   visit signin_path
#     #   fill_in "Email",       :with => user.email
#     #   fill_in "Password",    :with => user.password
#     #   click_button "Sign in"
#     # end
#     let(:user) { User.make }

#     let(:mail) { UserMailer.signup_confirmation(mail) }

#     it "renders the headers" do
#       expect(mail.subject).to eq("Confirmation of Sign Up")
#       expect(mail.to).to eq([""])
#       expect(mail.from).to eq(["massaad@gmail.com"])
#     end

#     it "renders the body" do
#       expect(mail.body.encoded).to match("Thank you for signing up. Welcome to the SMS Panda, hopefully one day these emails will do a bit more.")
#     end
#   end

# end
