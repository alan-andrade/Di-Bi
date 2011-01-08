class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.references  :store, :null => false
    end
  end

  def self.down
    drop_table :stocks
  end
end
