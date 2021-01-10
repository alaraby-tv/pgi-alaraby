require "administrate/base_dashboard"

class PartDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    viewing_form: Field::BelongsTo,
    id: Field::Number,
    in: Field::String,
    out: Field::String,
    duration: Field::String,
    note: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :viewing_form,
    :id,
    :in,
    :out,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :viewing_form,
    :id,
    :in,
    :out,
    :duration,
    :note,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :viewing_form,
    :in,
    :out,
    :duration,
    :note,
  ].freeze

  # Overwrite this method to customize how parts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(part)
  #   "Part ##{part.id}"
  # end
end
