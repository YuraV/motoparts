class WelcomeController < ApplicationController
  respond_to :html, :json
  helper_method :categories
  def index
    respond_with(categories)
  end

  private
  def categories
    @categories = Category.scoped
  end
end