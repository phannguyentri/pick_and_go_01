class JoinEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  delegate :name, to: :user, prefix: true
  delegate :email, to: :user, prefix: true
  delegate :phone, to: :user, prefix: true
  delegate :address, to: :user, prefix: true

  scope :find_by_event, ->id {where event_id: id}
  scope :newest, ->{order created_at: :desc}
end
