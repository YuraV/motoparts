class Product < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.boolean :published, default: true
      t.integer :folder_id
    end

    add_index :products, :folder_id
  end
end
