class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :sub_category_id
      t.string :title
      t.integer :code
      t.decimal :price_us, scale: 2, precision: 6
      t.text :description
      t.text :how_to_use
      t.text :ingredients
      t.string :tags, array: true

      t.timestamps
    end
  end
end
