class ApplicationController < ActionController::Base
  before_filter :user_
  
  def user_
    @user_id = session[:user_id]
    #p @user_id
    @is_admin = User.find(@user_id).is_admin if @user_id
   # p @is_admin
  end
  
  protect_from_forgery
end
