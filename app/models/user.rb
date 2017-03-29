class User < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :culturals, dependent: :destroy
  has_many :suggests, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :arriveds, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :join_events, dependent: :destroy
end
