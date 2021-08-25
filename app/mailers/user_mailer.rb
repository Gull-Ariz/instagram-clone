class UserMailer < ApplicationMailer
  default from: 'gull.ariz@devsinc.com'
  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(:to => @user.email, :subject => 'Welcome to instagram clone.')
  end
end



