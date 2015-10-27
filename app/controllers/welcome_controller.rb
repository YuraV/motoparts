class WelcomeController < ApplicationController
  respond_to :html, :json

  def index
    add_breadcrumb t('laouts.application.motoparts'), :root_path
    add_breadcrumb "Створити Нову Категорію", new_category_path if current_user
    respond_with(categories, :layout => !request.xhr?)
  end
end