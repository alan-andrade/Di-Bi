class Stock < ActiveRecord::Base
  validates_presence_of :store
  belongs_to  :store
  
  has_many  :stock_products,  :autosave=>true
  has_many  :products,  :through  =>  :stock_products
  
  accepts_nested_attributes_for :stock_products
      
end
