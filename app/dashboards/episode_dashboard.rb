require "administrate/base_dashboard"

class EpisodeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    product: Field::BelongsTo,
    user: Field::BelongsTo,
    production_company: Field::BelongsTo,
    po: Field::String,
    episode_number: Field::String,
    viewing_form: Field::HasOne,
    events: Field::HasMany,
    presenters: Field::HasMany,
    guests: Field::HasMany,
    marketing_materials: Field::HasMany,
    id: Field::Number,
    english_title: Field::String,
    arabic_title: Field::String,
    topic: Field::String,
    description: Field::Text,
    production_region: Field::String,
    first_shooting_date: Field::String,
    subtitled: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :product,
    :english_title,
    :episode_number,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :product,
    :user,
    :production_company,
    :po,
    :episode_number,
    :english_title,
    :arabic_title,
    :topic,
    :description,
    # :viewing_form,
    # :events,
    :presenters,
    :guests,
    :marketing_materials,
    :production_region,
    :first_shooting_date,
    :subtitled,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :product,
    :user,
    :production_company,
    :po,
    :episode_number,
    # :viewing_form,
    :events,
    :presenters,
    :guests,
    :marketing_materials,
    :english_title,
    :arabic_title,
    :topic,
    :description,
    :production_region,
    :first_shooting_date,
    :subtitled,
  ].freeze

  # Overwrite this method to customize how episodes are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(episode)
    "#{episode.english_title}"
  end
end
