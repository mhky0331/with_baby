class Equipment < ApplicationRecord

  self.table_name = 'equipments'
  has_many :facility_equipments, dependent: :destroy

  validates :name, presence: true

end
