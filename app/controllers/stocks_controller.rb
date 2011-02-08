class StocksController < ApplicationController
  ## Controlador para surtir a una tienda.
  def new
    @stores = Store.all
    @products = Brand.includes(:products).all
  end
  
  def create
    @store  = Store.find(params[:store_id])
    @store.stock.stock_products.build(params[:stock_products])
    @store.save ?
      redirect_to(store_stock_path) :
      render(:action=>'new')
  end
end
