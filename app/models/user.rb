class User < ActiveRecord::Base
  validates_presence_of :name
  belongs_to  :address
  accepts_nested_attributes_for :address
  has_many  :sales, :foreign_key  =>  "dealer_id"
end 
