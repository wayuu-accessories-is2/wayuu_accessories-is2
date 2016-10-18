class CategoryController < ApplicationController
  respond_to :html, :js
  def add
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      render layout: "admin"
    end
  end

  def new
    name = params['name']
    description = params['description']

    temp = Category.new
    temp.name = name
    temp.description = description

    temp.save!

    redirect_to list_category_index_path

  end
  def show
    @count_products = CategoryHasProduct.all
    @show_category = Category.all.order('name ASC').paginate(:page => params[:page],:per_page => 8)
    if request.xhr?
      respond_to do |format|
        format.js
      end
    end
    #render layout: "application"
  end

  def list
    @list = Category.all.order("id ASC")
    @consult = CategoryHasProduct.all
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      render layout: "admin"
    end
  end

  def edit
    @cate = Category.find( params[:id] )
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      render layout: "admin"
    end
  end

  def change
    if request.xhr?
      @cate = Category.find( params[:id] )
      @cate.name = params[:name]
      @cate.description = params[:description]
      @cate.save!
      redirect_to list_category_index_path
    end

  end

  def status
    @cate = Category.find( params[:id] )
    if @cate.status == 1
      @cate.status = 0
    else
      @cate.status = 1
    end
    @cate.save!
    redirect_to list_category_index_path
  end

  helper_method :find_image
  def find_image(cat_id)
    cate_dis = @count_products.where("category_id = " + cat_id.to_s )
      cat_image = nil
      cate_dis.each do |d|
        if ProductImage.find_by( product_id: d.product_id.to_s) != nil
          cat_image = ProductImage.find_by( product_id: d.product_id.to_s)
          break
        end
      end
    return cat_image
  end
  
  helper_method :find_discount
  def find_discount(cat_id)
    disc = false
    cate_dis = @count_products.where("category_id = " + cat_id.to_s )
    cate_dis.each do |d|
      if Product.find(d.product_id.to_s).discount != 0.0
        disc=true
        break
      end
    end
    return disc
  end

end
