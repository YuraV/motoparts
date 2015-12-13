class PropertyUnit < ActiveRecord::Base
  attr_accessible :property_id, :unit_id

  belongs_to :property
  belongs_to :unit

end