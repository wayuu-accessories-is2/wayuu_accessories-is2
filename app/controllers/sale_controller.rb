class SaleController < ApplicationController

	respond_to :html, :js



	def listsales
		@orders = Order.where(order_status_id: 2).order("created_at DESC")
    @orderstransaction = []
    @orders.each do |t|
      @orderstransaction << CustomerTransaction.find_by(order_id: t.id)
    end
	end

	def details
		details = params[:id]
		@detailorder = Order.find( details )
		@deliverycustomer = Customer.find( @detailorder.customer_id )
		@deliveryaddress = Address.find( @detailorder.address_id )

		@transaction = CustomerTransaction.where("order_id = ?", @detailorder.id ).first
		puts @transaction.inspect
		@billingcustomer = Customer.find( @transaction.customer_id )
		puts "pailas"
		@billingaddress = Address.find( @transaction.address_id )


		@productsorder = OrderProduct.where("order_id = ?", @detailorder.id )

	end


end
