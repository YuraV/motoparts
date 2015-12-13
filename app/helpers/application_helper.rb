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
    if item.respond_to?(:gallery)
      item.pictures.exists? ? item.gallery.pictures.first.url(:medium) : 'no_image.png'
    else
      item.picture ? item.picture.url(:medium) : 'no_image.png'
    end
  end

  def item_description(item)
    item.respond_to?(:description) ? item.description : ''
  end

  def first_three(resource)
    resource.first(3)
  end

  def first_records(resource, n)
    resource.first(n)
  end

  def euro_to_uah(amount)
    return 0 unless amount
    (Currency.uah.rate * amount).ceil
  end
end
