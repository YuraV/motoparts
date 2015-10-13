class AddCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :link_name
      t.boolean :published, default: true
    end
  end

end
