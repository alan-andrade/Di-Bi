class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :type
      t.string :email
      t.string :name    ,   :null =>  false
      t.references  :address
    end
  end

  def self.down
    drop_table :users
  end
end
