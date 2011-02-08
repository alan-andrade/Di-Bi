require 'ostruct'

class StockProduct < ActiveRecord::Base
  PERISHABLE_TAGS = [OpenStruct.new(:tag=>'1 mes', :date=>Date.today + 1.month),
                     OpenStruct.new(:tag=>'3 meses', :date=>Date.today + 3.months),
                     OpenStruct.new(:tag=>'6 meses', :date=>Date.today + 6.months),
                     OpenStruct.new(:tag=>'1 Ano', :date=>Date.today + 1.year)]
                     
                     
  validates_presence_of :product, :stock, :quantity
  validates_numericality_of :quantity,  :greater_than =>  0
  
  belongs_to  :product
  belongs_to  :stock
end
