class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :item_id
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.boolean :sales_status, default: false, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
