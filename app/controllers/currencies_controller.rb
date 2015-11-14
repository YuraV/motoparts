class CurrenciesController < ApplicationController
  respond_to :html, :json, :xml
  helper_method :uah


  def edit
    respond_with(uah, layout: false)
  end

  def update
    uah.update_attribute(:rate, params[:currency][:rate])
    respond_with uah, location: admin_panel_path
  end

  private

  def uah
    @uah ||= Currency.uah
  end
end