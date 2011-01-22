class Brand < ActiveRecord::Base
  validates_presence_of :name 
  validates_length_of :name , :minimum =>  1
  has_many  :products
  
  before_save {|brand| brand.name.capitalize! }
end
