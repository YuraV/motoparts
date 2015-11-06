class CategoriesController < ApplicationController
  respond_to :html, :json
  helper_method :category, :folders
  before_filter :authenticate_user!, except: [:index, :show]

  add_breadcrumb 'MotoParts', :root_path

  def index
    add_breadcrumb "Створити Нову Категорію", new_category_path if current_user
    respond_with(categories, layout: !request.xhr?)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def create
    @category = Category.new(params[:category])
    @category.save
    respond_with(@category, location: root_path)
  end

  def show
    add_breadcrumb category.name, category_path(category)
    add_breadcrumb "Створити Розділ", new_category_folder_path(category) if current_user
    respond_with(category, layout: !request.xhr? )
  end

  def edit
    respond_with(category)
  end

  def update
    category.update_attributes(params[:category])
    respond_with(category, location: root_path)
  end

  def destroy
    category.destroy
    respond_with(categories)
  end

  private
  def category
    @category = Category.find(params[:id])
  end

  def folders
    @folders ||= category.folders.paginate(:page => params[:page])
  end
end