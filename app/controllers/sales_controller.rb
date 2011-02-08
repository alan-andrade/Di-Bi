class SalesController < ApplicationController
  def new    
    @sale = Sale.new
  end
    
  def create    
    customer  = Customer.find params[:customer_id].slice(/\d/)
    @sale = Sale.new(params[:sale])
    @sale.customer  = customer
    @sale.sale_products << params[:sale_sale_product].map{|sp| SaleProduct.new sp }
    @sale.save    
    redirect_to new_sale_path
  end
end
