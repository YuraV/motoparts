class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :categories

  private
  def categories
    @categories ||= Category.paginate(:page => params[:page])
  end
end
