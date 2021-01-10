require "administrate/base_dashboard"

class PermissionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    product: Field::BelongsTo,
    id: Field::Number,
    can_edit_product: Field::Boolean,
    can_add_new_episode: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :product,
    :id,
    :can_edit_product,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :product,
    :id,
    :can_edit_product,
    :can_add_new_episode,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :product,
    :can_edit_product,
    :can_add_new_episode,
  ].freeze

  # Overwrite this method to customize how permissions are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(permission)
    "#{permission.user.full_name}"
  end
end
