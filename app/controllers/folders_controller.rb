class FoldersController < ApplicationController
  respond_to :html, :json
  helper_method :category, :folders, :folder, :products
  add_breadcrumb "MotoParts", :root_path

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    add_breadcrumb category.name, category_path(category)
    respond_with(folders, layout: !request.xhr? )
  end

  def show
    add_breadcrumb category.name, category_path(category)
    add_breadcrumb folder.name, category_folder_path(category,folder)
    add_breadcrumb "Створити новий товар в розділі #{folder.name}", new_category_folder_product_path(category,folder) if current_user
    respond_with(folder, layout: !request.xhr? )
  end

  def new
    @folder = category.folders.build

    respond_with(@folder)
  end

  def edit
    respond_with(folder)
  end

  def create
    @folder = category.folders.build(params[:folder])
    @folder.save ? respond_with(category) : flash.now[:error]
  end

  def update
    folder.update_attributes(params[:folder])
    respond_with([category, folder])
  end

  private
  def category
    @category ||= Category.find(params[:category_id])
  end

  def folders
    @folders ||= category.folders
  end

  def folder
    @folder ||= folders.find(params[:id])
  end

  def products
    @products ||= folder.products
  end
end