class CreateEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :equipments do |t|
      t.string :name, comment: '設備名', null: false, default: ""
      t.timestamps
    end
  end
end
