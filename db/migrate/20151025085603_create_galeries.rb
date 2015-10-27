class CreateGaleries < ActiveRecord::Migration
  def change
    create_table :galeries do |t|
      t.string :name
      t.integer :product_id
      t.timestamps
    end
  end
end
