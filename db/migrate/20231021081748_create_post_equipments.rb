class CreatePostEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_equipments do |t|
      t.references :post, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
