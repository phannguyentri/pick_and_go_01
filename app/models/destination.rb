class Destination < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :culturals, dependent: :destroy
  has_many :suggests, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :ratings, as: :rateable, dependent: :destroy

  mount_uploader :image, PictureUploader

  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :description, presence: true, length: {minimum: Settings.minimum}
  validates :content, presence: true, length: {minimum: Settings.minimum}
  validate :image_size

  scope :newest, ->{order created_at: :desc}
  scope :name_asc, ->{order name: :asc}

  private

  def image_size
    if image.size > Settings.mb.megabytes
      errors.add :image, t("model.hinhanh")
    end
  end
end
