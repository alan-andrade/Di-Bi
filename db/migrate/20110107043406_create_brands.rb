class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :brands
  end
end
