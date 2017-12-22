require 'unirest'
require 'pp'

#while true
  system "clear"

  p "Welcome to my products list!"
  p "Choose an option below!"
  p "[1] To show all of the products"
  p "[1.1] What do you want to search for?"
  p "[1.2] Show all products that belong to a particular category"
  p "[2] To see a particular product"
  p "[3] To make a new product"
  p "[4] To destroy a product"
  p "[5] To update a procuct"
  p "[6] To sign up"
  p "[7] To login"
  p "[8] To log out"
  p "[9] Purchase a product"
  p "[10] Look at all of the orders"
  p "[10] Add items to your shopping cart"
  p 'Type "exit" to leave'

  user_input = gets.chomp
  base_url = "http://localhost:3000"

  if user_input == "1" 

    response = Unirest.get("#{base_url}/products")
    pp response.body

  elsif user_input == "1.1"
    #the_parameters = {}
    p "What would you like to search for?"
    search_input = gets.chomp
    p "Would you like to sort by price? Enter 'true' if so"
    new_user_input = gets.chomp
    response = Unirest.get("#{base_url}/products", parameters: {search_term: search_input, sort_by_price: new_user_input})
    pp response.body

  elsif user_input == "1.2"
    p "what is the id of the category you want to look at?"
    user_category_id = gets.chomp
    response = Unirest.get("localhost:3000/products?category_id_input=#{user_category_id}")

    pp response.body

  elsif user_input == "2"

    p "Enter the id for the product you would like to look at!"
    product_id = gets.chomp

    response = Unirest.get("#{base_url}/product/#{product_id}")
    pp response.body 

  elsif user_input == "3"
    
    the_params = {}
    p "Please type in the attributes you want for your product"
    p "Choose a name!"
    the_params['name'] = gets.chomp
    p "Choose a price!"
    the_params['price'] = gets.chomp
    p "Choose an image!"
    the_params['image'] = gets.chomp
    p "Write a description!"
    the_params['description'] = gets.chomp

    response = Unirest.post("localhost:3000/products", parameters: the_params)
    pp response.body

  elsif user_input == "4"
    
    p "which product would you like to delete?"
    
    product_id = gets.chomp 
    response = Unirest.delete("#{base_url}/products/#{product_id}") 

    pp response.body

  elsif user_input == "5"
    p "under construction"
    exit



  elsif user_input == "6"
    p 'type your name'
    the_name = gets.chomp
    p 'type your email'
    email = gets.chomp
    p 'type your password'
    password = gets.chomp
    p 'confirm your password'
    password_confirmation = gets.chomp
    response = Unirest.post('localhost:3000/users', parameters: {
        name: the_name,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      }
    )
    pp response.body

  elsif user_input == "7"
    
    p "type your name"
    the_name = gets.chomp
    p "type your email"
    email = gets.chomp
    p "type your password"
    password = gets.chomp
    p "confirm your password"
    password_confirmation = gets.chomp
    response = Unirest.post('localhost:3000/users', 
      parameters: {
        name: "testing",
        email: "testing@mail.com",
        password: "password",
        password_confirmation: "password_confirmation" 
        }
    )
    pp response.body
  elsif user_input == "8"

  elsif user_input == "9"
    p "enter the product_id"
    product_id = gets.chomp
    p "enter the quantity"
    quantity = gets.chomp
    reponse = Unirest.post("#{base_url}
  /carted_products",
  parameters: {
    product_id: product_id,
    quantity: quantity
    })
    pp response.body
  end
#end