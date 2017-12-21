class OrdersController < ApplicationController
  
  def create_order 
    
    order = Order.new(
      product_id: params['product_id'], 
      quantity: params['quantity']
      )
    if order.save
      render json: order.as_json
    else
      render json: {errors: order.errors.full_message}
    end
  end
end
