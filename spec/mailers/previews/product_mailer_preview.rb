# Preview all emails at http://localhost:3000/rails/mailers/product_mailer
class ProductMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/product_mailer/email_on_creation
  def email_on_creation
    ProductMailerMailer.email_on_creation
  end

  # Preview this email at http://localhost:3000/rails/mailers/product_mailer/email_on_update
  def email_on_update
    ProductMailerMailer.email_on_update
  end

end
