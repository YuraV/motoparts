class AddAttachmentToPicture < ActiveRecord::Migration
  def up
    add_attachment :pictures, :picture
  end

  def down
    remove_attachment :pictures, :picture
  end
end
