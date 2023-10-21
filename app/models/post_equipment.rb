class PostEquipment < ApplicationRecord

  self.table_name = 'post_equipments'
  belongs_to :post
  belongs_to :equipment
end
