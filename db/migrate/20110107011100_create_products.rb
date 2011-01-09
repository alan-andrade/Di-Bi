class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :sku
      t.string  :name,      :null =>  false
      t.references  :brand
      t.float   :base_price, :null =>  false
      t.text    :description   
    end
  end

  def self.down
    drop_table :products
  end
end
