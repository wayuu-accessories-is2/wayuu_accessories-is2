class CheckoutController < ApplicationController

  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

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
    puts params["firstname"]
    respond_to do |format|
      format.js
    end

    redirect_to billing_checkout_index_path

  end

  def billing

  end

  def billingComplete


    redirect_to second_checkout_index_path
  end

  def second
    @valor = 99.9
    @client_token = Braintree::ClientToken.generate
    render layout: "payment"

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



  def new
    @client_token = Braintree::ClientToken.generate
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success? || result.transaction
      redirect_to checkout_path(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
  end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your transaction has been successfully processed."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}."
      }
    end
  end

end
