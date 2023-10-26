class CreatePostEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_equipments do |t|
      t.integer :post_id, null: false
      t.integer :equipment_id
      t.timestamps
    end
  end
end
