class Equipment < ApplicationRecord

  has_many :facility_equipments, dependent: :destroy

  validates :name, presence: true

end
