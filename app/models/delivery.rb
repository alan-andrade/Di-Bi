class Delivery < ActiveRecord::Base
  STATUS  = ['pendiente','entregado'].freeze
  attr_protected  :status
  
  validates_presence_of :customer, :shipping_address, :sale , :status,  :due_date
  validates_inclusion_of  :status,  :in =>  STATUS
  validate :future_due_date
  before_validation :set_status
  
  belongs_to  :customer
  belongs_to  :shipping_address,  :class_name =>  "Address",  :validate =>  true
  belongs_to  :sale
  belongs_to  :owner            , :class_name =>  "User"
  
  accepts_nested_attributes_for :shipping_address    
  
  private
    def future_due_date
      self.due_date = Date.today + 1.day  if self.due_date.nil?
      errors.add :due_date, "Cant deliver in the past" if self.due_date < Date.today
    end
    
    def set_status  
      self.status = STATUS[0] if self.new_record?
    end
end
