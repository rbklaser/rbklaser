class Resource < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :exam_id
	
	
	belongs_to :exam
	
end
