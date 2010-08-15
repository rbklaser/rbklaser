class Comment < ActiveRecord::Base
	validates_presence_of :user_id
	validates_presence_of :content
	validates_presence_of :exam_id
	belongs_to :user
	
end
