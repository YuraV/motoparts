class Category < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :link_name, :published

  friendly_id :link_name, use: :slugged

  has_many :folders
  has_many :products, as: :assignment
  has_many :assignments
end