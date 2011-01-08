require 'test_helper'

class BossTest < ActiveSupport::TestCase    
  
  test 'Creation of Boss' do
    boss = Boss.new(:name=>'Gallo',:email=>"gallito7@gmail.com", 
                  :address_attributes=>{:street=>"Ventiscas", :city=>'Mexico', :zip=>"23478"})
    assert(boss.valid?, "CEO is not Valid")
  end
  
  test 'Manage a Store' do
    ceo = users(:ceo)
    store = stores(:atizapanStore)
    ceo.stores << store
    ceo.save
    assert(ceo.stores.size == 1, "Cannot set a store properly")
  end
end
