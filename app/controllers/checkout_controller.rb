class CheckoutController < ApplicationController

  respond_to :html, :js

  def index

    current_cart
    @productcart = []
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    # respond_to do |format|
    #   format.html
    # end

  end

  def cart

    current_cart
    @productcart = []
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end

    respond_to do |format|
      format.html
    end

  end
  def first

    respond_to do |format|
      format.js
    end

  end

  def first_data

    redirect_to second_checkout_index_path

  end

  def second

    respond_to do |format|
      format.js
    end

  end

  def second_data
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
    respond_to do |format|
        format.js
    end
  end

  helper_method :total
  def total()
    @sum = 0.0
    session[:cart].each do |key, array|
      e = Product.find( key.to_s )
      e.quantity = array
      @productcart << e
    end
    @productcart.each do |p|
      if p.discount !=0.0
        @sum+=(p.price.to_i - p.discount.to_i)* p.quantity.to_i
      else
        @sum+= (p.price.to_i)*p.quantity.to_i
      end
    end
    return @sum/2
  end

end
