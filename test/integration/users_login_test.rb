require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should create a new user' do
    get root_path
    assert_select 'button', 'log in', count:1
    assert_select 'a[href=?]', sessions_destroy_path, count:0
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {name: 'sarah', email: 'sarah@gmail.com', password: '123456', password_confirmation: '123456'}}
    end
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

  test 'should create session' do
    get root_path
    assert_select 'button', 'log in', count:1
    assert_select 'a[href=?]', sessions_destroy_path, count:0
    post sessions_create_path, params: { session: {email: @user.email, password:'password'}}
    assert is_logged_in?
    follow_redirect!
    assert_select 'a[href=?]', sessions_destroy_path, count:1
  end

  test 'should not create session with wrong password' do
    get root_path
    assert_select 'button', 'log in', count:1
    assert_select 'a[href=?]', sessions_destroy_path, count:0
    post sessions_create_path, params: { session: {email: @user.email, password:''}}
    assert_not is_logged_in?
  end


end
