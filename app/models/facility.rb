class Facility < ApplicationRecord

  belongs_to :user, optional: true
  has_many :posts, dependent: :destroy
  has_many :facility_equipments, dependent: :destroy
  has_many :equipments, through: :facility_equipments

  has_many_attached :facility_photos

  validates :name, :content, :latitude, :longitude, :facility_photos, presence: true

end
