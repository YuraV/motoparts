class ApplicationController < ActionController::Base
  # layout proc { !request.xhr? }
  protect_from_forgery
  helper_method :categories

  private
  def categories
    @categories ||= Category.scoped
  end
end
