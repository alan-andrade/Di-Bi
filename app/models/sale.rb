class Sale < ActiveRecord::Base
  validates_presence_of :total, :dealer, :customer, :store
  validates_numericality_of :total, :greater_than => 0.0 
  validate :store_has_stock_products

  belongs_to  :dealer   ,         :class_name =>  'User'
  belongs_to  :customer ,         :class_name =>  'User'
  belongs_to  :store
  
  has_many    :sale_products
  has_many    :products,  :through  =>  :sale_products
  
  #accepts_nested_attributes_for :customer
  #accepts_nested_attributes_for :sale_products
 
  before_validation   :set_total
  before_save         :stock_math

    
  private 
    def set_total
      counter = 0
      self.sale_products.each{|p| counter +=  ((p.price || p.product.base_price) * p.quantity) }
      self.total  = counter
    end  
    
    def stock_math  ## StockProducts are the products present in a store. CANT sell if you have no stock products
      stock = store.stock          
      sale_products.each do |sp|
        stp = stock.stock_products.where(:product_id=>sp.product_id).first
        raise "No stock Products" if stp.nil?
        if stp.quantity >= sp.quantity
          stp.update_attribute :quantity, stp.quantity -= sp.quantity
        end
      end
    end
    
    def store_has_stock_products
      if store.stock.stock_products.empty?
        p "No stock Products"
        errors.add(:base, "No tienes productos en el Stock de Esta tienda.")
      end
    end
end
