class Equipment < ApplicationRecord

  self.table_name = 'equipments'
  has_many :facility_equipments, dependent: :destroy
  has_many :facilities, through: :facility_equipments

  validates :name, presence: true

end
