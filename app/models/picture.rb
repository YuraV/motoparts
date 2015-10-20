class Picture < ActiveRecord::Base
  attr_accessible :picture

  belongs_to :slider

  delegate :url, to: :picture

  has_attached_file :picture, :styles => { :slider => "750x299", :demoslider => "618x246" ,:medium => "640x480>", :thumb => "200x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }
  # do_not_validate_attachment_file_type :image

end
