require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  test 'Delivery for a sale' do
    sale  = Sale.find(:first)
    delivery  = Delivery.new :sale =>  sale,
                              :customer =>  sale.customer,
                              :due_date =>  Date.today + 1.day,
                              :shipping_address =>  sale.customer.address,
                              :owner    =>  User.find_by_name('Alan Andrade')
    assert delivery.save, 'Simple Delivery Error'
  end
end
