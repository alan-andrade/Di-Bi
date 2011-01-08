require 'test_helper'

class StockProductTest < ActiveSupport::TestCase
  test 'add products to stock' do
    stock = stocks(:store_stock)
    product1  = products(:capslim_etapa_1)
    product2  = products(:capslim_etapa_2)
    stock.stock_products.build  :product    =>  product1,
                                :quantity   =>  30,
                                :perish_on  =>  Date.today + 6.months
    stock.stock_products.build  :product    =>  product2,
                                :quantity   =>  40,
                                :perish_on  =>  Date.today  + 6.months                               
    stock.save
    assert stock.stock_products.count == 4, "Adding products to stock fails. FIXME"                                
  end

  test 'discount from stock when a sale is made' do
    dealer  = users(:aris)
    
    sale  = dealer.sales.build :customer =>  users(:maryDeJust),
                               :store    =>  stores(:atizapanStore)
    sale.sale_products.build   :product  =>  products(:capslim_etapa_1),
                               :price    =>  120,
                               :quantity  =>  1
    sale.sale_products.build   :product  =>  products(:capslim_etapa_2),
                               :quantity  => 2
    sale.save   
    product_in_stock  = sale.store.stock.stock_products.where(:product_id =>  products(:capslim_etapa_1).id).first
    assert product_in_stock.quantity == 9 
  end

end
