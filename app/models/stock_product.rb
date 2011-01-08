class StockProduct < ActiveRecord::Base
  validates_presence_of :product, :stock, :quantity
  validates_numericality_of :quantity,  :greater_than =>  0
  
  belongs_to  :product
  belongs_to  :stock
end
