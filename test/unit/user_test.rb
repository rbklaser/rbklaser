require 'test_helper'
require 'digest/sha1'


class UserTest < ActiveSupport::TestCase
	fixtures :users
	
	def test_truth
    assert true
	end
	
	def test_do_not_save_when_too_less_info
	 user = User.new(:name => "aa")
	 assert !user.save, "Zapisano usera mimo, ze podane za malo danych"
	end
	
	def test_create_user
	  user = User.new(:email => "nothingmatters@email.com", :name => "test", :sec_name => "test", :is_admin => false,
	  :pass => "ts", :nrdziennika => 1, :nrtel => 100400400, :email_confirmation => "nothingmatters@email.com", 
	   :pass_confirmation => "ts")
	  assert user.save
	end
	def test_restrict_create_user_with_busy_email_and_or_nrdziennika
    user = User.new(:email => "busyemail@email.com", :name => "test", :sec_name => "test", :is_admin => false,
      :pass => "ts", :nrdziennika => 1, :nrtel => 100400400, :email_confirmation => "busyemail@email.com", 
        :pass_confirmation => "ts")
	  # ten powinien sie zapisac
	  assert user.save
	  
	  user2 = User.new(:email => "busyemail@email.com", :name => "test", :sec_name => "test", :is_admin => false,
      :pass => "ts", :nrdziennika => 1, :nrtel => 100400400, :email_confirmation => "busyemail@email.com", 
        :pass_confirmation => "ts")
	  # ten nie powinien sie zapisac bo ma taki sam email
	  assert !user2.save
	end
	
	def test_auth
	  user_created = User.new(:email => "busyemail@email.com", :name => "test", :sec_name => "test", :is_admin => false,
      :pass => "ts", :nrdziennika => 1, :nrtel => 100400400, :email_confirmation => "busyemail@email.com", 
        :pass_confirmation => "ts")
	  user_created.save
	  assert User.auth("busyemail@email.com", "ts")
  end
  
  def test_fail_auth
    user_created = User.new(:email => "busyemail@email.com", :name => "test", :sec_name => "test", :is_admin => false,
      :pass => "ts", :nrdziennika => 1, :nrtel => 100400400, :email_confirmation => "busyemail@email.com", 
        :pass_confirmation => "ts")
    user_created.save
    assert !User.auth("busyemail@email.com", "bad_pass")
  end
end
