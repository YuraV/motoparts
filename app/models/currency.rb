class Currency < ActiveRecord::Base
  attr_accessible :currency, :rate

  def self.euro
    where(currency: "EUR").first
  end

  def self.uah
    where(currency: "UAH").first
  end
end