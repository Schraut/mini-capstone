class ChangeDescriptionDataType < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :description, :text
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 9, scale: 2
    add_column :products, :in_stock, :string
  end
end
# Your description attribute may currently use the wrong data-type(string). Update it with the correct one if needed.

# Update the price attribute with the correct data-type. Be mindful of the correct number digits your type of products require.

# Bonus: Add an attribute you can use to describe if the product is in-stock or out-of-stock.