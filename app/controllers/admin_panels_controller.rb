class AdminPanelsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
  helper_method :folder, :folders, :category, :uah

  def show

  end

  private
  def category
    @category ||= Category.find(params[:category_id])
  end

  def folders
    @folders ||= category.folders
  end

  def folder
    @folder ||= folders.find(params[:folder_id])
  end

  def uah
    @uah ||= Currency.uah
  end
end