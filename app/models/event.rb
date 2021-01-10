class Event < ApplicationRecord
  belongs_to :attainable, polymorphic: true, optional: true
  belongs_to :guest, optional: true
  belongs_to :presenter, optional: true
end
