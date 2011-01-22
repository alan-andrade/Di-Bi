class BrandsController < ApplicationController
  def create
    @brand  = Brand.new(params[:brand])
    
    respond_to do |format|     
        format.js   { @brand  } 
        format.html { render :action=>'new', :controller=>'products'}        
    end
  end
end
