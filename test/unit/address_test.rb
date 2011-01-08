require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "Valid register" do
    myAddress = Address.new(:street=>'Ventiscas #23', :city=>'Naucalpan', :zip=>'54230')    
    assert myAddress.save == true
  end
  
  test 'Invalid Address' do
    myAddress = Address.new(:city=>'Naucalpan')
    assert(!myAddress.save, "Oooppssi, no street, no zip")
  end
  
  test 'Invalid ZipCode' do
    myAddress = Address.new(:street=>'Alsdf #45', :city=>'Villas', :zip=>'342f3')
    assert(!myAddress.save, "Invalid ZIP Code")
  end
end
