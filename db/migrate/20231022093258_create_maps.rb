class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.float :latitude
      t.float :longitude
      t.string :text

      t.timestamps
    end
  end
end
