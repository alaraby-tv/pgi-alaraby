class ProductMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.email_on_creation.subject
  #
  def email_on_creation(product)
    @product = product
    attachments.inline["alaraby_logo.png"] = File.read("#{Rails.root}/app/assets/images/alaraby_logo.png")

    mail from: "noreply@pgi-alaraby.tv", to: array_of_emails(ProductEmail.creation), subject: "New Product Created"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.email_on_update.subject
  #
  def email_on_update(product)
    @product = product
    attachments.inline["alaraby_logo.png"] = File.read("#{Rails.root}/app/assets/images/alaraby_logo.png")

    mail from: "noreply@pgi-alaraby.tv", to: array_of_emails(ProductEmail.updated), subject: "#{@product.english_title} Updated"
  end
end
