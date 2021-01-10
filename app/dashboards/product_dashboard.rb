require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    product_type: Field::BelongsTo,
    duration: Field::BelongsTo,
    broadcasting_frequency: Field::BelongsTo,
    production_company: Field::BelongsTo,
    po: Field::String,
    nature: Field::BelongsTo,
    category: Field::BelongsTo,
    genre: Field::BelongsTo,
    department: Field::BelongsTo,
    viewing_form: Field::HasOne,
    events: Field::HasMany,
    presenters: Field::HasMany,
    guests: Field::HasMany,
    marketing_materials: Field::HasMany,
    episodes: Field::HasMany,
    permissions: Field::HasMany,
    permited_users: Field::HasMany.with_options(class_name: "User"),
    ages: Field::HasMany,
    genders: Field::HasMany,
    educations: Field::HasMany,
    regions: Field::HasMany,
    broadcast_media: Field::HasMany,
    id: Field::Number,
    logo: Field::String,
    english_title: Field::String,
    arabic_title: Field::String,
    full_description: Field::Text,
    short_description: Field::String,
    number_of_episodes: Field::Number,
    season: Field::Number,
    production_region: Field::String,
    production_year: Field::String,
    broadcasting_year: Field::String,
    first_shooting_date: Field::String,
    subtitled: Field::Boolean,
    broadcasting_date: Field::String,
    broadcasting_time: Field::String,
    status: Field::String,
    format_and_structure: Field::Text,
    programme_benchmark: Field::Text,
    marketing_message_ideas: Field::Text,
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
    :product_type,
    :english_title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :logo,
    :english_title,
    :arabic_title,
    :full_description,
    :short_description,
    :user,
    :product_type,
    :duration,
    :broadcasting_frequency,
    :production_company,
    :po,
    :nature,
    :category,
    :genre,
    :department,
    # :viewing_form,
    :events,
    :presenters,
    :guests,
    :marketing_materials,
    :episodes,
    :permissions,
    :permited_users,
    :ages,
    :genders,
    :educations,
    :regions,
    :broadcast_media,
    :number_of_episodes,
    :season,
    :production_region,
    :production_year,
    :broadcasting_year,
    :first_shooting_date,
    :subtitled,
    :broadcasting_date,
    :broadcasting_time,
    :status,
    :format_and_structure,
    :programme_benchmark,
    :marketing_message_ideas,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :product_type,
    :duration,
    :broadcasting_frequency,
    :production_company,
    :po,
    :nature,
    :category,
    :genre,
    :department,
    # :viewing_form,
    :events,
    :presenters,
    :guests,
    :marketing_materials,
    :episodes,
    :permissions,
    :permited_users,
    :ages,
    :genders,
    :educations,
    :regions,
    :broadcast_media,
    :logo,
    :english_title,
    :arabic_title,
    :full_description,
    :short_description,
    :number_of_episodes,
    :season,
    :production_region,
    :production_year,
    :broadcasting_year,
    :first_shooting_date,
    :subtitled,
    :broadcasting_date,
    :broadcasting_time,
    :status,
    :format_and_structure,
    :programme_benchmark,
    :marketing_message_ideas,
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(product)
    "#{product.english_title}"
  end
end
