class Category < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :link_name, :published

  friendly_id :link_name

  has_many :folders

end