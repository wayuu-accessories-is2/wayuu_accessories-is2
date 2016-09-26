class ShopController < ApplicationController

  #before_action :require_admin, only: [:admin_index]

  def refreshcart
    current_cart
    @productcart = []
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    @productcart.each do |q|
      print q.name
    end
  end

  def deletecart
    id = params[:id]
    current_cart
    @productcart = []
    session[:cart].delete( id )
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    @productcart.each do |q|
      print q.name
    end
  end

end
