class Galery < ActiveRecord::Base
  attr_accessible :name

  has_many :pictures
  belongs_to :product
end
