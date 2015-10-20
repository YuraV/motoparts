class FoldersController < ApplicationController
  respond_to :html, :json

  helper_method :category, :folders, :folder

  def index
    respond_with(folders)
  end

  def show
    respond_with(folder)
  end

  def new
    @folder = category.folders.build

    respond_with(@folder)
  end

  def create
    @folder = category.folders.build(params[:folder])
    @folder.save ? respond_with(category) : flash.now[:error]
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
end