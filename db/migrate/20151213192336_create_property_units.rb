class CreatePropertyUnits < ActiveRecord::Migration
  def change
    create_table :property_units do |t|
      t.integer :property_id
      t.integer :unit_id

      t.timestamps
    end
  end
end
