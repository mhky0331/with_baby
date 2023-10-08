class CreateFacilityEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_equipments do |t|

      t.timestamps
    end
  end
end
