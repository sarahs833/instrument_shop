require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sarah)
    @user_no_valid = users(:alex)
  end


end
