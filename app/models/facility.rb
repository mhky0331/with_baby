class Facility < ApplicationRecord

  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy


  has_many_attached :facility_photos

  validates :name, :content, :lat, :lng, presence: true

  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

end
