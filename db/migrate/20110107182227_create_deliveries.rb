class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table :deliveries do |t|
      t.references  :sale               , :null =>  false
      t.references  :shipping_address   , :null =>  false
      t.references  :customer           , :null =>  false
      t.references  :owner
      t.string      :status             , :null =>  false
      t.date        :due_date           , :null =>  false
      t.string      :notes
    end
  end

  def self.down
    drop_table :deliveries
  end
end
