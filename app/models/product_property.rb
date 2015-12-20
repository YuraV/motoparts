class ProductProperty < ActiveRecord::Base
  attr_accessible :product_id, :property_id, :unit_id

  belongs_to :product
  belongs_to :property
  belongs_to :unit

  validates_presence_of :product_id, :property_id, :unit_id
end
