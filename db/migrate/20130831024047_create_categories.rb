class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
