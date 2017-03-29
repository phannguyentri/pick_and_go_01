class Event < ApplicationRecord
  has_many :join_events, dependent: :destroy

  belongs_to :destination
end
