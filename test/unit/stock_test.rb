require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'create stock after store creation' do
    store = Store.new :name => "Latosos",
                      :address => Address.find(:first)
    store.save
    assert store.stock,
      "Fix Store Before Create Callback to create stock"
  end
  
  test 'avoid saving without a store' do
    stock = Stock.new
    assert !stock.save,  "It's saving without a store"
  end
  
  test 'updating a store dont create another stock' do
    store = Store.new :name => "Latosos",
                      :address => Address.find(:first)
    store.save
    store = Store.find_by_name("Latosos")
    store.name  = "Altenia"
    store.save
    assert Stock.where(:store_id => store.id).count == 1 , "More stocks than needed"
  end
end
