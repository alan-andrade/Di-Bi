class BrandsController < ApplicationController
  def create
    @brand  = Brand.new(params[:brand])
    if @brand.save
      respond_to do |format|
        format.json { render :json => @brand.to_json }
      end
    end
  end
end
