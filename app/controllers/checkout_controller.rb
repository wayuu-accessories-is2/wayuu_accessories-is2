class CheckoutController < ApplicationController

  def index

    respond_to do |format|
      format.html
    end

  end

  def first

    respond_to do |format|
      format.js
    end
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
