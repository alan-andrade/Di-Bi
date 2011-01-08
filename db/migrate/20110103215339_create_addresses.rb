class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street, :null => false
      t.string :city, :null =>  false
      t.string :zip
    end
  end

  def self.down
    drop_table :addresses
  end
end
