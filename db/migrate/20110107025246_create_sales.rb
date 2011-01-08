class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.float :total  , :null =>  false
      t.references  :customer , :null =>  false
      t.references  :dealer   , :null =>  false
      t.references  :store    
      t.timestamps        
    end
  end

  def self.down
    drop_table :sales
  end
end
