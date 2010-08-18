class HomeController < ApplicationController
  def index
    @exams = Exam.all(:conditions => ["date >= ?", Time.now], :order => "date ASC", :limit => 10 )
  end

end
