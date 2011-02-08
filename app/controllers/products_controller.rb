class ProductsController < ApplicationController

  def index
    @products = Product.find(:all, :include => :brand)
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(products_path, :notice => 'Producto regsitrado exitosamente.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(products_path, :notice => 'Se actualizo exitosamente el producto.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    name  = params[:name]
    @products = Product.where("name LIKE '%#{name}%'").includes(:brand)
    respond_to do |format|
      format.js{ 
        render :json => ActiveSupport::JSON.encode(
          @products.map do |p|
            {:name=>p.name, :brand=>p.brand_name, :id=>p.id, :price=>p.base_price}
          end
          )
      }
    end
  end
end
