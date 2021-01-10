# Preview all emails at http://localhost:3000/rails/mailers/attachment
class AttachmentPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/attachment/email_on_creation
  def email_on_creation
    AttachmentMailer.email_on_creation
  end

  # Preview this email at http://localhost:3000/rails/mailers/attachment/email_on_delete
  def email_on_delete
    AttachmentMailer.email_on_delete
  end

end
