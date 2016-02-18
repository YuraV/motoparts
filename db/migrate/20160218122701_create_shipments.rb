class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.text :description

      t.timestamps
    end
  end
end
