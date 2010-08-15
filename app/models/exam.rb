class Exam < ActiveRecord::Base
	has_many :comments
	has_many :resources
	validates_presence_of :description 
	validates_presence_of :name
	validates_presence_of :date
	validates_presence_of :subject
end
