require "administrate/base_dashboard"

class MarketingMaterialDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    attachments: Field::HasMany,
    marketable: Field::Polymorphic,
    material_type: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    readiness_date: Field::String,
    user_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :attachments,
    :marketable,
    :material_type,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :attachments,
    :marketable,
    :material_type,
    :id,
    :name,
    :readiness_date,
    :user_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :attachments,
    :marketable,
    :material_type,
    :name,
    :readiness_date,
    :user_id,
  ].freeze

  # Overwrite this method to customize how marketing materials are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(marketing_material)
    "#{marketing_material.name}"
  end
end
