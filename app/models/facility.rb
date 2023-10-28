class Facility < ApplicationRecord

  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy


  has_many_attached :facility_photos

  validates :name, :content, :lat, :lng, presence: true

  # def favorited_by?(current_user)
  #   favorites.exists?(user_id: current_user.id)
  # end

  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

end
