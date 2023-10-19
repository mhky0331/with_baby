class Post < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :facility, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many_attached :posted_photo

  validates :content, presence: true

  def self.search(keyword)
    where("facility.name LIKE ?", "%#{keyword}%")
  end

end
