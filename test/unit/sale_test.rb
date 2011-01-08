require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  test 'Simple Sale Creation' do
    sale  = Sale.new  :customer =>  users(:maryDeJust),
                      :dealer   =>  users(:ceo),
                      :store    =>  stores('atizapanStore')
    sale.sale_products.build(:product =>  products(:capslim_etapa_2), :price  => 50, :quantity=>2 )                      
    assert(sale.save, "Simple Sale Failed")
  end  
  
  test 'User has sales' do
    user  = User.find_by_name("Alan Andrade")
    assert(!user.sales.empty?, "Failed Associating")
  end
end
