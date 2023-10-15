class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities, comment: '施設' do |t|
      t.integer :user_id, null: false
      t.string :name, comment: '施設名', null: false, default: ""
      t.text :content, comment: '投稿内容', null: false, default: ""
      t.float :latitude, comment: '緯度', null: false, default: 0
      t.float :longitude, comment: '経度', null: false, default: 0
      t.timestamps
    end
  end
end
