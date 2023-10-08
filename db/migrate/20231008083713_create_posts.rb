class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content, comment: '投稿内容', null: false, default: ""
      t.timestamps
    end
  end
end
