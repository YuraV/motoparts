class WelcomeController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(categories, :layout => !request.xhr?)
  end
end