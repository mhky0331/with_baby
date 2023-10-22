class CreatePostEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_equipments do |t|
      t.references :post, null: false
      t.references :equipment
      t.timestamps
    end
  end
end
