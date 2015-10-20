class Product < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :picture, :description, :folder_id

  belongs_to :folders

  friendly_id :name, use: :slugged

  has_attached_file :picture, :styles => { :medium => "212x158>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

end