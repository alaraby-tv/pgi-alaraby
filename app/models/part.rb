class Part < ApplicationRecord
  belongs_to :viewing_form, optional: true
end
