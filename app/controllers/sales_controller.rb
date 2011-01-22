class SalesController < ApplicationController
  def new    
    @sale = Sale.new
  end
    
  def create
    @sale = Sale.new(params[:sale])
    p @sale
    redirecto_to :action=>'new'
  end
end
