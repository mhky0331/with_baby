class Post < ApplicationRecord

  belongs_to :user
  belongs_to :facility
  has_many :post_equipments, dependent: :destroy
  has_many :equipments, through: :post_equipments
  has_many :comments, dependent: :destroy

  has_many_attached :posted_photos

  validates :content, :equipment_ids, presence: true

  def self.search(keyword)
    where("facility.name LIKE ?", "%#{keyword}%")
  end

end
