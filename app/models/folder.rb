class Folder < ActiveRecord::Base
  # extend FriendlyId
  attr_accessible :name, :category_id, :published, :picture

  has_many :products, dependent: :destroy
  has_many :properties, through: :products
  has_many :product_properties, through: :products

  has_many :brands, through: :products

  belongs_to :category

  validates_presence_of :name

  # friendly_id :name, use: :slugged

  has_attached_file :picture, :styles => { :medium => "168x168>", :thumb => "100x100>" }, :default_url => "no_image.png"
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  self.per_page = 32
end