class CategoryController < ApplicationController
  def add
  end

  def new
    name = params['category_name']
    description = params['category_description']

    temp = Category.new
    temp.name = name
    temp.description = description

    temp.save!

    redirect_to '/admin/category/show'

  end

  def show
    @list = Category.all.order("id ASC")
    @consult = CategoryHasProduct.all
  end

  def edit
    @cate = Category.find( params[:id] )
  end

  def update
    @cate = Category.find( params[:id] )
    @cate.name = params['category_name']
    @cate.description = params['category_description']
    @cate.save!
    redirect_to '/admin/category/show'
  end

  def status
    @cate = Category.find( params[:id] )
    if @cate.status == 1
      @cate.status = 0
    else
      @cate.status = 1
    end
    @cate.save!
    redirect_to '/admin/category/show'
  end

end
