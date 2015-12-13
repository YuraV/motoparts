class Product < ActiveRecord::Base
  # extend FriendlyId
  attr_accessible :name, :description, :folder_id, :price, :brand_id

  delegate :pictures, to: :gallery

  belongs_to :folder

  belongs_to :brand
  accepts_nested_attributes_for :brand

  has_one :gallery
  has_one :category, through: :folder

  has_many :product_properties
  has_many :properties, through: :product_properties
  has_many :units, through: :product_properties

  scope :by_brand,    -> (ids) { where(brand_id: ids) }
  scope :by_property, -> (ids) { joins(:product_properties).where(product_properties: { unit_id: ids }).uniq }



  # has_attached_file :picture, :styles => { :medium => "212x158>", :thumb => "100x100>" }, :default_url => "no_image.png"
  # validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  # scope :first_four, ->  {first(4)}

  self.per_page = 32

end