class Equipment < ApplicationRecord

  self.table_name = 'equipments'
  has_many :post_equipments, dependent: :destroy
  has_many :posts, through: :post_equipments

  validates :name, presence: true

end
