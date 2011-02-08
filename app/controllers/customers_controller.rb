class CustomersController < ApplicationController
  def search  
    @customers  = Customer.where(['name LIKE ?', "%#{params[:customer_name]}%"]).includes(:address).all
    respond_to do |format|
      format.js{@customers}      
    end
  end
end
