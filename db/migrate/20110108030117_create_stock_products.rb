class CreateStockProducts < ActiveRecord::Migration
  def self.up
    create_table :stock_products do |t|
      t.references  :stock    , :null =>  false
      t.references  :product  , :null =>  false
      t.integer     :quantity , :null =>  false
      t.date        :perish_on
      t.timestamps
    end
  end

  def self.down
    drop_table :stock_products
  end
end
