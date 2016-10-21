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
		@productsorder = OrderProduct.where("order_id = ?", @detailorder.id )

	end


end
