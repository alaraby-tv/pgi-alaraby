class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper
  default from: 'noreply@alarabypgi.com'
  layout 'mailer'
end
