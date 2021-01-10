class ViewingFormMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    attachments.inline["alaraby_logo.png"] = File.read("#{Rails.root}/app/assets/images/alaraby_logo.png")
    
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
