class Folder < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.boolean :published, default: true
    end
  end
end
