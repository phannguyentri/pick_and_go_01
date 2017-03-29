class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
end
