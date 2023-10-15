class CreateFacilityEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :facility_equipments do |t|
      t.references :facility, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
