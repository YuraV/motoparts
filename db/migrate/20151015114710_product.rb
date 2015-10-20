class Product < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.text :description
      t.boolean :published, default: true
      t.string :slug
      t.integer :folder_id
    end

    add_index :products, [:slug, :id, :folder_id]
  end
end
