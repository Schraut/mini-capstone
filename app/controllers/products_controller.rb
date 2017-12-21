class ProductsController < ApplicationController
  #before_action :authenticate_admin, only: [:create, :update, :destroy]


  def show_products
    my_store = Product.all
    #render json: {message: 'testing'}

    render json: my_store.as_json
  end

  def find_single_product
    #test_message = "It's working"
    #render json: {message: test_message}

    the_products = Product.all 
    render json: product.as_json
  end
   
  def find_item
    product = Product.find_by(name: "toothbrush")
    render json: {message: 'hello'}
  end

  # def index
  #   render json: {message: 'it works!'}
  # end

  def index 
    # products = Product.all
    #  # the_search_term = params[:search_term] 
    #  # products = Product.order(:id => :asc).where("title LIKE ?", "%#{the_search_term}")
    # render json: products.as_json
    category = Category.find_by(id: params[:category_id_input])
    products = category.products 

    render json: products.as_json
  end

  def show 
    the_id = params['id']
    product = Product.find_by(id: params['id'])
    render json: product.as_json
  end 

  def create
    product = Product.new(
      name: params['name'], 
      price: params['price'], 
      image: params['image'],
      description: params['description'] 
    )
    product.save
    render json: product.as_json
    # if product.save
    #   render json: product.as_json
    # else
    #   render json: {errors: product.errors.full_message}
    # end
  end

  def update
    the_id = params['id']
    product = Product.find_by(id: the_id)
    recipe.name = params['name']
    recipe.price = params['price']
    recipe.image = params['image']
    recipe.description = params['description']
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_message}
    end
  end

  def destroy 
    the_id = params['id']
    product = Product.find_by(id: the_id)
    recipe.destroy
  end

end
