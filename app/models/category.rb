class Category < ActiveRecord::Base
  # extend FriendlyId
  attr_accessible :name, :picture, :published

  # friendly_id :link_name, use: :slugged

  has_attached_file :picture, :styles => { :medium => "220x160>", :thumb => "100x100>" }, :default_url => "no_image.png"
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  has_many :folders

  self.per_page = 32
end