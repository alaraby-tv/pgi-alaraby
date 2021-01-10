module ApplicationHelper
  def true_or_false?(object)
    if object
      content_tag(:span, '', class: 'glyphicon glyphicon-ok')
    else 
      content_tag(:span, '', class: 'glyphicon glyphicon-remove')
    end
  end

  def array_of_emails(object)
    object.select(:email).collect(&:email)
  end

  def allowed_user? product, user
    product.permited_users.include?(user) || product.user == user
  end
end
