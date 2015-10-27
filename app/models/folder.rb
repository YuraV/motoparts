class Folder < ActiveRecord::Base
  # extend FriendlyId
  attr_accessible :name, :category_id, :published, :picture

  has_many :products
  belongs_to :category

  # friendly_id :name, use: :slugged

  has_attached_file :picture, :styles => { :medium => "212x158>", :thumb => "100x100>" }, :default_url => "no_image.png"
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

end