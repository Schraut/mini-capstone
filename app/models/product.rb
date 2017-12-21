class Product < ApplicationRecord
  
  has_many :orders
  belongs_to :supplier
  has_many :carted_products
  has_many :categories, through: :carted_products
  
  validates :price, presence: true
  validates :price, numericality: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 1..50}
  validates :image, presence: true 
  validates :image, length: { in: 1..20}
  
  def as_json
    { 
      id: id,
      name: name,
      price: price,
      image: image, 
      description: description,
      in_stock: in_stock,
      supplier: supplier.as_json

    }
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discounted
    if price < 2
      return true
    else 
      return false
    end
  end

  def tax
    tax = price * (0.09)
    p tax 
    p price
  end

  def total 
    total = price + tax
  end
# will return the sum of the price + tax.
end
