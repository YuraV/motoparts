module ApplicationHelper

  def bootstrap_class_for(flash_type)
    { success: 'success',
      error: 'error',
      alert: 'block',
      notice: 'info' }[flash_type] || flash_type.to_s
  end

  def active_slider
    Slider.active.first
  end

  def item_picture(item)
    (item.respond_to?(:picture) && item.picture) ? item.picture.url(:medium) : 'no_image.png'
  end

  def item_description(item)
    item.respond_to?(:description) ? item.description : ''
  end

  def first_four(resource)
    resource.first(4)
  end
end
