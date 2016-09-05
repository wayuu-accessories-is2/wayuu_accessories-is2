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

    temp.save!

    #puts @stock.errors.any?
    #puts temp.errors.full_messages

    @catego = CategoryHasProduct.new
    @catego.product_id = temp.id
    @catego.category_id = @cat.id
    @catego.save!
    session[:productid] = temp.id
    #redirect_to list_product_index_path
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
    @pro = Product.find( params[:id] )
    @cate = Category.all
    @sele = (CategoryHasProduct.find_by( product_id: @pro.id.to_s )).category_id
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
    val = CategoryHasProduct.find_by( product_id: t.id )
    cat = Category.find_by( name: category1.to_s )

    val.category_id = cat.id

    val.save!
    t.save!


    redirect_to list_product_index_path
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
    puts arreglo.length
    puts arreglo
    puts "veaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    redirect_to list_product_index_path
  end

end
