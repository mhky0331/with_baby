class FacilityEquipment < ApplicationRecord

  belongs_to :facility, optional: true
  belongs_to :equipment, optional: true

end
