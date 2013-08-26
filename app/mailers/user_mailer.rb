class UserMailer < ActionMailer::Base
  default from: "bhtamsky@gmail.com"
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    #mail(to: @user.email, subject: 'Welcome to My Awesome Site',body: "dhfdjshfdskfhdskjfsdk")
    #mail(to: @user.email, subject: 'Welcome to My Awesome Site',template_path: 'user_mailer', template_name: 'welcome_email')
    mail(to: @user.email, subject: 'Welcome to My Awesome Site') do |format|
      format.text
      format.html { render "mail"}
    end
  end
end
