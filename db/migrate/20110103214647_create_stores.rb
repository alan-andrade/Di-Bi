class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :name, :null =>  false
      t.references :address
      t.references :boss
    end
  end

  def self.down
    drop_table :stores
  end
end
