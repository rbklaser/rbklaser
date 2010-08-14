class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :sec_name
      t.integer :nrdziennika
      t.string :nrtel
      t.boolean :has_avatar
      t.boolean :is_admin
      t.string :pass
      t.string :email
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
