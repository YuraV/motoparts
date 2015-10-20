class Slider < ActiveRecord::Base
  attr_accessible :name, :active

  has_many :pictures

  scope :active, -> { where(active: true) }

end
