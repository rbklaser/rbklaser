

class UserTest < ActiveSupport::TestCase
	fixtures :users
	
	def test.auth
		assert_equal @bob, User.auth("bob@sekwana.pl", "test")
	end
end
