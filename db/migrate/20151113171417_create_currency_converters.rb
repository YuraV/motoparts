class CreateCurrencyConverters < ActiveRecord::Migration
  def up
    create_table :currencies do |t|
      t.string :currency
      t.decimal :rate, :precision => 16, :scale => 2

      t.timestamps
    end
    Currency.create!(currency: "EUR", rate: 1.00)
    Currency.create!(currency: "UAH", rate: 25.00)
  end

  def down
    drop_table :currencies
  end
end
