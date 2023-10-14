class FacilityEquipment < ApplicationRecord

  self.table_name = 'facility_equipments'
  belongs_to :facility, optional: true
  belongs_to :equipment, optional: true

end
