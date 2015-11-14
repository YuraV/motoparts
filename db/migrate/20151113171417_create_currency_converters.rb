class CreateCurrencyConverters < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :currency
      t.float :rate, :precision => 16, :scale => 2

      t.timestamps
    end
  end
end
