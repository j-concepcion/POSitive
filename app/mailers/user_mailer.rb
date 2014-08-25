class UserMailer < ActionMailer::Base
  default from: Base::Settings.application.mailer.from
  
  def welcome_email(user, password)
    @user = user
    @password = password
    mail(to: user.email, subject: 'New Account Registration')
  end
end
