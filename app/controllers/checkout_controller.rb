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
    respond_to do |format|
      format.html
    end

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

end
