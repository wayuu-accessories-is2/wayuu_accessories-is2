class ProductController < ApplicationController

	respond_to :html, :js

	def index
		@id = Category.find( params[:id] )
		@products = Product.where("category_id = " + @id.id )
	end

	def add
		@cate = Category.all.order('name ASC')
  #render layout: "admin"
  respond_to do |format|
  	format.js
  end
end

def showall
	@count_products = CategoryHasProduct.where(:category_id => params[:category_id])
	@from_category = Category.find(params[:category_id])
	@show_products =[]
	@count_products.each do |p|
		@show_products.push(Product.find(p.product_id.to_s))
	end
	@show_products = @show_products.paginate(:page => params[:page],:per_page => 6)
end

def newest
	@newest = Product.joins("INNER JOIN category_has_products ON category_has_products.product_id = products.id WHERE category_id ="+ params[:category_id].to_s).order(created_at: :desc)
	@newest = @newest.paginate(:page => params[:page],:per_page => 6)
end

def pricelow
	@pricelow = Product.joins("INNER JOIN category_has_products ON category_has_products.product_id = products.id WHERE category_id ="+ params[:category_id].to_s).order(price: :asc)
	@pricelow = @pricelow.paginate(:page => params[:page],:per_page => 6)
end

def pricehigh
	@pricehigh = Product.joins("INNER JOIN category_has_products ON category_has_products.product_id = products.id WHERE category_id ="+ params[:category_id].to_s).order(price: :desc)
	@pricehigh = @pricehigh.paginate(:page => params[:page],:per_page => 6)
end

def pricerange
	str= params['price']
	str1 = str.scan(/\d+|\D+/).to_a
	min = str1[1].to_s
	max = str1[3].to_s
	@pricerange = Product.joins("INNER JOIN category_has_products ON category_has_products.product_id = products.id").where("category_id = ? AND price >= ? AND price <=? ", params[:category_id], min,max)
	@pricerange = @pricerange.paginate(:page => params[:page],:per_page => 6)
end

def new
	name = params['name']
	description = params['description']
	model = params['model']
	price = params['price']
	tax_class_id = params['tax_class_id']
	quantity = params['quantity']
	length = params['length']
	width = params['width']
	height = params['height']
	weight = params['weight']
	discount = params['product_discount_price']
	status = params['status']
	category1 = params['category1']
	@cat = Category.find_by name: category1.to_s
	product_discount_start = params['product_discount_start']
	product_discount_end = params['product_discount_end']
	if discount == ""
		discount = 0.0
	end

	temp = Product.new
	temp.name = name
	temp.quantity = quantity.to_i
	temp.description = description
	temp.price = price
	temp.length = length
	temp.width = width
	temp.height = height
	temp.status = status
	temp.discount = discount
	temp.weight = weight

	temp.save!
    #puts @stock.errors.any?
    #puts temp.errors.full_messages

    @catego = CategoryHasProduct.new
    @catego.product_id = temp.id
    @catego.category_id = @cat.id
    @catego.save!
    session[:productid] = temp.id
		session[:order] = 1
    #redirect_to list_product_index_path
    #@imagen = params['images']
    if request.xhr?
    	respond_to do |format|
    		format.js
    	end

    end


end

def show
#@list = Product.all.order("id ASC")
#@consult = CategoryHasProduct.all
#respond_to do |format|
#  format.js
#end
@product = Product.find( params[:id] )
@cate = Category.all.order('name ASC')
@comments = Review.where(product_id: params[:id]).order('created_at DESC')

respond_to do |format|
	format.html
end
render layout: "application"

puts @product
end


def edit
	@pro = Product.find( params[:id] )
	@cate = Category.all
	@sele = (CategoryHasProduct.find_by( product_id: @pro.id.to_s )).category_id
	@image_show = ProductImage.where( :product_id => @pro.id.to_s).order("sort_order")
end

def change
	t = Product.find( params[:id] )
	t.name = params['name']
	t.description = params['description']
	t.price = params['price']
	t.quantity = params['quantity']
	t.length = params['length']
	t.width = params['width']
	t.height = params['height']
	category1 = params['category1']
	discount = params['product_discount_price']
	if discount == ""
		discount = 0
	end
	t.discount = discount
	val = CategoryHasProduct.find_by( product_id: t.id )
	cat = Category.find_by( name: category1.to_s )

	val.category_id = cat.id

	val.save!
	t.save!
  #redirect_to list_product_index_path
end

def list
	@products = Product.all
end

def status
	@pro = Product.find( params[:id] )
	if @pro.status == "1"
		@pro.status = "0"
	else
		@pro.status = "1"
	end
	@pro.save!
	redirect_to list_product_index_path

end

def orderimages
	respond_to do |format|
		format.js
	end
end

def showforcategory

end

def sortimages
	arreglo = params['info']
  #puts arreglo.length
  #puts arreglo
  #puts "veaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  redirect_to list_product_index_path
end

end
