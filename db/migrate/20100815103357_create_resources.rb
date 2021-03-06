class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.integer :exam_id
      t.string :name
      t.text :content
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
