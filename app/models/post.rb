class Post < ApplicationRecord

  belongs_to :user
  belongs_to :facility
  has_many :post_equipments, dependent: :destroy
  has_many :equipments, through: :post_equipments
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many_attached :posted_photos

  validates :content, presence: true

  def self.search(keyword)
    where("facility.name LIKE ?", "%#{keyword}%")
  end

  def favorited_by?(current_user)
    favorites.exists?(user_id: current_user.id)
  end
end
