class FacilityEquipment < ApplicationRecord

  self.table_name = 'facility_equipments'
  belongs_to :facility
  belongs_to :equipment

end
