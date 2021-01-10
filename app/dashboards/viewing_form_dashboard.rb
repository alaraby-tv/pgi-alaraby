require "administrate/base_dashboard"

class ViewingFormDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    viewable: Field::Polymorphic,
    user: Field::BelongsTo,
    parts: Field::HasMany,
    id: Field::Number,
    contact_number: Field::String,
    programme_id: Field::String,
    ingest_date: Field::String,
    tx_date: Field::String,
    aspect_ratio: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :viewable,
    :user,
    :parts,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :viewable,
    :user,
    :parts,
    :id,
    :contact_number,
    :programme_id,
    :ingest_date,
    :tx_date,
    :aspect_ratio,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :viewable,
    :user,
    :parts,
    :contact_number,
    :programme_id,
    :ingest_date,
    :tx_date,
    :aspect_ratio,
  ].freeze

  # Overwrite this method to customize how viewing forms are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(viewing_form)
  #   "ViewingForm ##{viewing_form.id}"
  # end
end
