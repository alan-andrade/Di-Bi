class Address < ActiveRecord::Base
  validates_numericality_of :zip
  validates_length_of  :zip, :is  => 5
  validates_presence_of :street    
end
