class UserMailer < ActionMailer::Base
  default from: "admin@proflo.ws"
  
  def welcome_email(user)
    @user = user
    @url = 'http://proflo.ws/'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
end