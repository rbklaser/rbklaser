class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.string :subject
      t.string :name
      t.text :description
      t.datetime :date
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end
end
