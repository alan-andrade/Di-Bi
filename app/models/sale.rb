class Sale < ActiveRecord::Base
  validates_presence_of :total, :dealer, :customer, :store
  validates_numericality_of :total, :greater_than => 0.0   

  belongs_to  :dealer   ,         :class_name =>  'User'
  belongs_to  :customer ,         :class_name =>  'User'
  belongs_to  :store
  
  has_many    :sale_products
  has_many    :products,  :through  =>  :sale_products
 
  before_validation   :set_total
  before_save         :stock_math

    
  private 
    def set_total
      counter = 0
      self.sale_products.each{|p| counter +=  ((p.price || p.product.base_price) * p.quantity) }
      self.total  = counter
    end  
    
    def stock_math
      stock = store.stock          
      sale_products.each do |sp|
        stp = stock.stock_products.where(:product_id=>sp.product_id).first
        if stp.quantity >= sp.quantity
          stp.update_attribute :quantity, stp.quantity -= sp.quantity
        end
      end
    end  
end
