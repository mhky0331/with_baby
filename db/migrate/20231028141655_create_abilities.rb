class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|

      t.timestamps
    end
  end
end
