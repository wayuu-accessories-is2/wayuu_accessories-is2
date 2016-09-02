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
    status = params['status']
    category1 = params['category1']
    @cat = Category.find_by name: category1.to_s
    product_discount_price = params['product_discount_price']
    product_discount_start = params['product_discount_start']
    product_discount_end = params['product_discount_end']


    temp = Product.new
    temp.name = name
    temp.quantity = quantity.to_i
    temp.description = description
    temp.price = price
    temp.length = length
    temp.width = width
    temp.height = height
    temp.status = status


    if temp.quantity >= 1
      @stock = StockStatus.find( 1 )
    else
      @stock = StockStatus.find( 2 )
    end
    @stock.products << temp


    temp.save!

    #puts @stock.errors.any?
    #puts temp.errors.full_messages

    @catego = CategoryHasProduct.new
    @catego.product_id = temp.id
    @catego.category_id = @cat.id
    @catego.save!

    redirect_to list_product_index_path
    #@imagen = params['images']
  end

  def show
    @list = Product.all.order("id ASC")
    @consult = CategoryHasProduct.all
    respond_to do |format|
      format.js
    end
  end

  def edit
    @cate = Product.find( params[:id] )
  end

  def update
    @cate = Category.find( params[:id] )
    @cate.name = params['category_name']
    @cate.description = params['category_description']
    @cate.save!
    redirect_to list_product_index_path
  end

  def list
    @products = Product.all
  end

  def orderimages
    respond_to do |format|
      format.js
    end
  end

  def showforcategory

  end

end
