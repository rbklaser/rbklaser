class Exam < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	has_many :resources, :dependent => :destroy
	# Nie ma potrzeby
	# accepts_nested_attributes_for :resources, :allow_destroy => true
	validates_presence_of :description 
	validates_presence_of :name
	validates_presence_of :date
	validates_presence_of :subject
end
