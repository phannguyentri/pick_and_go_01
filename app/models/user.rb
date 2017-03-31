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

  mount_uploader :image, PictureUploader

  VALID_FULLNAME_REGEX = /[\w]+([\s]+[\w]+){1}+/
  validates :name, presence: true, length: {maximum: Settings.maximum_name},
    format: {with: VALID_FULLNAME_REGEX}
  validates :phone, presence: true, numericality: {only_integer: true},
    length: {in: Settings.min_range_phone..Settings.max_range_phone}
  validates :address, presence: true,
    length: {maximum: Settings.maximum_address}
  validate  :image_size

  scope :newest, ->{order created_at: :desc}

  private

  def image_size
    if image.size > Settings.mb.megabytes
      errors.add :image, t("model.hinhanh")
    end
  end
end
