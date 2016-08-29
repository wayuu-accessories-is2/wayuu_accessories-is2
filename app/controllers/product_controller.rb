class ProductController < ApplicationController
  def add
  end

  def new
    name = params['product_name']
    description = params['product_description']
    model = params['model']
    price = params['price']
    tax_class_id = params['tax_class_id']
    quantity = params['quantity']
    length = params['length']
    width = params['width']
    height = params['height']
    status = params['status']
    category1 = params['category1']
    category2 = params['category2']
    category3 = params['category3']
    category4 = params['category4']
    product_discount_price = params['product_discount_price']
    product_discount_start = params['product_discount_start']
    product_discount_end = params['product_discount_end']

    temp = Product.new
    temp.name = name
    temp.quantity = quantity.to_i
    temp.price = price.to_f
    temp.weight = length.to_f
    temp.width = width.to_f
    temp.height = height.to_f
    temp.status = status
    temp.description = description

    temp.save!

    redirect_to '/admin/index'
    imagen = params['images']
  end
end
