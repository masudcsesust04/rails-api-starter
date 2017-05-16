class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def forgot_password(user)
    @user = user
    mail(to: @user.email, subject: 'Reset your password')
  end
end
