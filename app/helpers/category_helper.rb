module CategoryHelper
  def category_picture(category)
    category.picture ? category.picture.url(:medium) : 'no_image.png'
  end
end