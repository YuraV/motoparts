class Product < ActiveRecord::Base
  # extend FriendlyId
  attr_accessible :name, :picture, :price, :description, :folder_id

  belongs_to :folder
  has_one :gallery

  # friendly_id :name, use: :slugged

  has_attached_file :picture, :styles => { :medium => "212x158>", :thumb => "100x100>" }, :default_url => "no_image.png"
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  scope :first_four, ->  {first(4)}

  self.per_page = 32

end