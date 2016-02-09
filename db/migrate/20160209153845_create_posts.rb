class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :image

      t.integer :user_id, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
