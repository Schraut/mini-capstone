class CartedProductsController < ApplicationController
  def create
    carted_product = cartedProduct.new(
      
      product_id: params['product_id'], 
      quantity: params['quantity']
     
    )
    carted_product.save
    render json: product.as_json
      
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_message}
    end
  end

  def index

  end
end
