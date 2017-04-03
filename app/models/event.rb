class Event < ApplicationRecord
  has_many :join_events, dependent: :destroy

  belongs_to :destination

  mount_uploader :image, PictureUploader

  validates :title, presence: true, length: {maximum: Settings.maximum_name}
  validates :content, presence: true, length: {minimum: Settings.minimum}
  validate :start_date_before_end_date
  validates :time_end, presence: true
  validates :time_start, presence: true
  validate :image_size

  delegate :name, to: :destination, prefix: true

  scope :newest, ->{order created_at: :desc}
  scope :allow_registration, ->do
    where "? BETWEEN time_start AND time_end", Time.now.to_date
  end
  scope :not_allow_registration, ->{where "? > time_end ", Time.now.to_date}

  private

  def start_date_before_end_date
    if self.time_start > self.time_end
      errors.add(:time_start, t("model.validate_time"))
    end
  end

  def image_size
    if image.size > Settings.mb.megabytes
      errors.add :image, t("model.hinhanh")
    end
  end
end
