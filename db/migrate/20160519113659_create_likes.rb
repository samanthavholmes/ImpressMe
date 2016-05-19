class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :value, default: 0
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps null: false
    end
  end
end
