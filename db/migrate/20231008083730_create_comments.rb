class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content, comment: '内容', null: false, default: ""
      t.timestamps
    end
  end
end
