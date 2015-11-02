class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :categories

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    flash[:error] = "Record Not Found"
    redirect_to root_path
  end

  private
  def categories
    @categories ||= Category.paginate(:page => params[:page])
  end
end
