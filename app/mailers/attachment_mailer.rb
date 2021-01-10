class AttachmentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.attachment_mailer.email_on_creation.subject
  #
  def email_on_creation(attachment)
    @attachment = attachment
    @product = attachment.marketing_material.marketable
    attachments.inline["alaraby_logo.png"] = File.read("#{Rails.root}/app/assets/images/alaraby_logo.png")
    
    mail to: array_of_emails(AttachmentEmail), subject: "New Attachment Created"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.attachment_mailer.email_on_delete.subject
  #
  def email_on_delete(attachment)
    @attachment = attachment
    attachments.inline["alaraby_logo.png"] = File.read("#{Rails.root}/app/assets/images/alaraby_logo.png")
    
    mail to: array_of_emails(AttachmentEmail), subject: "Attachment Deleted"
  end
end
