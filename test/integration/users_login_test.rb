require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @activated = users(:two)
    ActionMailer::Base.deliveries.clear
  end

  test 'should create a new user and send activation mail' do
    get root_path
    assert_select 'button', 'log in', count:1
    assert_select 'a[href=?]', sessions_destroy_path, count:0
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {name: 'maxime', email: 'maxime@gmail.com', password: 'password', password_confirmation: 'password'}}
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    assert_not is_logged_in?
    post sessions_create_path, params: {session: {email: 'maxime@gmail.com', password: 'password'} }
    assert_not is_logged_in?
    get edit_account_activation_path(user.activate_token,email: user.email)
    assert user.reload.activated?
    assert is_logged_in?
  end

   test 'should fail creating new user' do
    get root_path
    assert_select 'button', 'log in', count:1
    assert_select 'a[href=?]', sessions_destroy_path, count:0
    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: 'sarah', email: 'sarah@gmail.com', password: '1', password_confirmation: '1'}}
    end
    get root_path
    assert_not flash.empty?
  end


  test 'should not create session with wrong password' do
    get root_path
    assert_select 'button', 'log in', count:1
    assert_select 'a[href=?]', sessions_destroy_path, count:0
    post sessions_create_path, params: { session: {email: @user.email, password:''}}
    assert_not is_logged_in?
  end

  test 'should be able to logout if already log in ' do
    get root_path
    assert_select 'button', 'log in', count:1
    assert_select 'a[href=?]', sessions_destroy_path, count:0
    post sessions_create_path, params: { session: {email: @activated.email, password:'password'}}
    assert is_logged_in?
    delete sessions_destroy_path
    assert_not is_logged_in?
  end


end
