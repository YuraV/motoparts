class Folder < ActiveRecord::Base
  attr_accessible :name, :category_id, :published, :picture

  has_many :products
  belongs_to :category

  has_attached_file :picture, :styles => { :medium => "280x190>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end