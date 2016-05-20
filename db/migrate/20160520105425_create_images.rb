class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.string :alt_text

      t.timestamps null: false
    end
  end
end
