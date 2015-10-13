class AddPictureToFolder < ActiveRecord::Migration
  def up
    add_attachment :folders, :picture
  end

  def down
    remove_attachment :folders, :picture
  end
end
