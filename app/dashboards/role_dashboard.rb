require "administrate/base_dashboard"

class RoleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    can_invite_new_user: Field::Boolean,
    can_create_product: Field::Boolean,
    can_view_all_products: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :users,
    :id,
    :name,
    :can_invite_new_user,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :id,
    :name,
    :can_invite_new_user,
    :can_create_product,
    :can_view_all_products,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :name,
    :can_invite_new_user,
    :can_create_product,
    :can_view_all_products,
  ].freeze

  # Overwrite this method to customize how roles are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(role)
    "#{role.name}"
  end
end
