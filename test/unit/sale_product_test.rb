require 'test_helper'

class SaleProductTest < ActiveSupport::TestCase
  test 'Sale Has Products' do
    sale    = sales(:firstSale)
    product = products(:capslim_etapa_2)
    sale.sale_products.build(:product => product , :price  =>  100, :quantity => 2)
    sale.save
    assert(sale.total == 200, "Calculations of total is wrong")
  end
end
