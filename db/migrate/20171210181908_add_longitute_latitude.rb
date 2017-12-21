class AddLongituteLatitude < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :longitude, :float
    add_column :products, :latitude, :float 
  end
end
