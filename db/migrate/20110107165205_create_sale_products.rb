class CreateSaleProducts < ActiveRecord::Migration
  def self.up
    create_table :sale_products do |t|
      t.references  :product, :null =>  false
      t.references  :sale   , :null =>  false
      t.float       :price  , :null =>  false
      t.integer     :quantity , :null =>  false
    end
  end

  def self.down
    drop_table :sale_products
  end
end
