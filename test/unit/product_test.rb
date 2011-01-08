require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'Basic Product Creation' do
    product = Product.new :name =>  'Etapa 2',  
                          :sku  =>  123123123, 
                          :base_price =>  100.0,
                          :brand_attributes =>  {:name=>"Capslim"}
    assert(product.save, "Simple Product Creation Failed")
  end
end
