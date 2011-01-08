require 'test_helper'

class UserTest < ActiveSupport::TestCase    
  
  test 'Creations of new User' do
    user = User.new :name=>'Gallo',
                    :email=>"gallito7@gmail.com",
                    :address_attributes=>
                      {:street=>"Ventiscas",
                       :city=>'Mexico', 
                       :zip=>"23478"}
                       
    assert(user.save, "User is not Valid")
  end  
end
