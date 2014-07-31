class UserMailer < ActionMailer::Base
  default from: "george@proflo.ws"
  
  def welcome_email(user)
    @user = user
    @url = 'http://proflo.ws/'
    @activation_url
    mail(to: user.email, subject: 'Welcome to ProFlows')
  end
end