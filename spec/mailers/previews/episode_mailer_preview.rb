# Preview all emails at http://localhost:3000/rails/mailers/episode_mailer
class EpisodeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/episode_mailer/email_on_creation
  def email_on_creation
    EpisodeMailerMailer.email_on_creation
  end

  # Preview this email at http://localhost:3000/rails/mailers/episode_mailer/email_on_update
  def email_on_update
    EpisodeMailerMailer.email_on_update
  end

end
