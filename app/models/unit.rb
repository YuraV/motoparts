class Unit < ActiveRecord::Base
  attr_accessible :name

  has_many :product_properties
  has_many :products, through: :product_properties

  has_many :property_units
  has_many :properties, through: :property_units

  validates :name, uniqueness: true

  scope :not_in_property, -> (ids) {where(arel_table[:id].not_in(ids))}
end