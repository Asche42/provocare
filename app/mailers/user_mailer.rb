class UserMailer < ActionMailer::Base
  default from: '"Bureau Provocare" <bureau@provocare.fr>'

  def welcome_email(user)
    @user = user
    @url = 'http://www.provocare.fr'
    email_with_name = %("#{@user.firstname} #{@user.lastname}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Bienvenue sur Provocare !')
  end
end
