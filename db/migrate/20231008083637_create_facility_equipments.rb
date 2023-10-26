class CreateFacilityEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_equipments do |t|
      t.integer :facility_id, null: false
      t.integer :equipment_id, null: false
      t.timestamps
    end
  end
end
