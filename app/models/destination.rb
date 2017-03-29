class Destination < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :culturals, dependent: :destroy
  has_many :suggests, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :ratings, as: :rateable, dependent: :destroy
end
