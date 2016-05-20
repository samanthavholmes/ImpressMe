class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.string :caption
      t.references :user, foreign_key: true
      t.integer :image_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
