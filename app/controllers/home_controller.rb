class HomeController < ApplicationController
  def index
    @exams = Exam.all
  end

end
