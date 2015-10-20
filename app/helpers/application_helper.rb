module ApplicationHelper

  def active_slider
    Slider.active.first
  end

  def item_picture(item)
    item.respond_to?(:picture) ? item.picture.url(:medium) : 'no_image.png'
  end

  def item_description(item)
    item.respond_to?(:description) ? item.description : "name: #{item.name}"
  end
end
