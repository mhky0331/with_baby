class PostEquipment < ApplicationRecord
  belongs_to :post
  belongs_to :equipment
end
