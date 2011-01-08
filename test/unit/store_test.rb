require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  test 'Simple New Store' do
    ms  = Store.new(:name=>'Boulevares',:address_attributes=>{:city=>'Naucalpan', :street=>'Ventiscas 32', :zip => '45303'})
    assert(ms.save, "Invalid Store Parameters")
  end
  
  test 'No Address' do
    ms  = Store.new(:name => :Atizapunk)
    assert(!ms.save, "Store Saved without any Adddress.")
  end
end
