require 'test_helper'

class ResetPasswordTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @activated = users(:two)
    ActionMailer::Base.deliveries.clear
  end

  test "reset password" do
    post password_resets_path, params: { password_reset: {email: @activated.email} }
    user = assigns(:user)
    assert user.reset_token
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not is_logged_in?
    get edit_password_reset_path(user.reset_token,email: user.email)
    patch password_reset_path(user.reset_token), params: {email: user.email, user: {password: 'newpassword', password_confirmation: 'newpassword'}}
    users = assigns(:user)
    assert is_logged_in?
    assert users.reset_sent_at.present?
    delete sessions_destroy_path
    assert_not is_logged_in?
    post sessions_create_path, params: { session: {email: users.email, password:'password'}}
    assert_not is_logged_in?
    post sessions_create_path, params: { session: {email: users.email, password:'newpassword'}}
    assert is_logged_in?
  end
end
