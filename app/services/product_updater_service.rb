class ProductUpdaterService
  attr_accessor :product, :params

  def self.update(options)
    new(options).update
  end

  def initialize(options = {})
    @product = options[:product]
    @params  = options[:params]
  end

  def update
    if params.has_key?(:content)
       product.update_attribute(:description, params[:content][:description][:value]) and return nil
    else
      product.update_attributes(params[:product])
    end
  end
end