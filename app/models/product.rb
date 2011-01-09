class Product < ActiveRecord::Base
  validates_presence_of :name,  :base_price,  :brand
  validates_numericality_of :base_price, :greater_than  => 0.0
  
  belongs_to  :brand
  
  has_many  :sale_products
  has_many  :sales,   :through  =>  :sale_products
  
  has_many  :stock_products
  has_many  :stocks,  :through  =>  :stock_products
  
  def brand_name
    self.brand.name if brand
  end
  
  def brand_name=(attributes)
    self.brand = Brand.find_by_name(attributes)   
  end
end
