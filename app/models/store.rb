class Store < ActiveRecord::Base
  validates_presence_of :name, :address
  
  belongs_to  :address
  belongs_to  :boss
  has_many    :sales
  has_one     :stock
  
  before_create :give_a_stock  
  
  accepts_nested_attributes_for :address, :stock
  
  private 
    def give_a_stock
      self.build_stock  if self.new_record?
    end
  
end
