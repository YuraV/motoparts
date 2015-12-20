class Property < ActiveRecord::Base
  attr_accessible :name

  has_many :product_properties
  has_many :products, through: :product_properties

  has_many :property_units
  has_many :units, through: :property_units

  validates_presence_of :name
end
