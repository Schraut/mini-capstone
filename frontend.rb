require 'unirest'
require 'pp'
system "clear"

p "Welcome to my products list!"
p "Choose an option below!"
p "[1] to see all the products"
p "[1.1] what do you want to search for?"
p "[1.2] show all products that belong to a particular category"
p "[2] to see a particular product"
p "[3] to make a new product"
p "[4] to destroy a product"
p "[5] enter your address to see longitude and latitude"
p "[6] to type in some attributes you want for the product"
p "[7] to sign up"
p "[8] to login"
p "[9] to logout"

user_input = gets.chomp
base_url = "http://localhost:3000"

if user_input == "1" 

  response = Unirest.get("#{base_url}/products")
  pp response.body

elsif user_input == "1.1"
  #the_parameters = {}
  p "what would you like to search for?"
  search_input = gets.chomp
  response = Unirest.get("#{base_url}/products", parameters: {search_term: search_input})
  product = response.body
  pp product 

elsif user_input == "1.2"
  

elsif user_input == "2"

  p "Enter the id for the product you would like to look at!"
  product_id = gets.chomp

  response = Unirest.patch("#{base_url}/product/:id/#{product_id}")
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
  
  the_params = {}
  p "What should the name be?"
  the_params = gets.chomp
  p "What should the price be?"
  the_params = gets.chomp
  p "What should the image be?"
  the_params = gets.chomp
  p "What should the description be?"
  the_params = gets.chomp

  response = Unirest.post("#{base_url}/products", parameters: the_params)

  pp response.body


elsif user_input == "7"

  the_params = {}
  p "enter your username"
  the_params['name'] = gets.chomp
  p "enter your email" 

elsif user_input == "8"
  
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
else user_input == "9"

end



#response = Unirest.post("#{base_url}//products")

#p response.body