class EpisodeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.episode_mailer.email_on_creation.subject
  #
  def email_on_creation(episode)
    @episode = episode
    @product = @episode.product
    attachments.inline["alaraby_logo.png"] = File.read("#{Rails.root}/app/assets/images/alaraby_logo.png")

    mail to: array_of_emails(EpisodeEmail.creation), subject: 'New Episode Created'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.episode_mailer.email_on_update.subject
  #
  def email_on_update(episode)
    @episode = episode
    @product = @episode.product
    attachments.inline["alaraby_logo.png"] = File.read("#{Rails.root}/app/assets/images/alaraby_logo.png")

    mail to: array_of_emails(EpisodeEmail.updated), subject: "Episode #{@episode.english_title} Updated"
  end
end
