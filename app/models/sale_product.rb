class SaleProduct < ActiveRecord::Base
  validates_presence_of :price, :quantity
  validates_numericality_of :price, :greater_than =>  0.0
  validates_numericality_of :quantity, :greater_than => 0
  belongs_to  :product
  belongs_to  :sale               
  
  before_validation :set_price
  
  def name
    product.name  if product
  end
  
  def name=(name)
    product = Product.find_or_create_by_name(name)
  end
  
  private
    def set_price
      self.price  = self.product.base_price if self.price.nil?
    end
    
end
