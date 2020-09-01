ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def log_in_as(user)
    session[:user_id] = user.id
  end

   def is_logged_in?
    !session[:user_id].nil?
  end

  def current_cart?
    session[:cart_id].nil?
  end

  def current_user(user)
    if session[:user_id]
     session[:user_id] = user.id
    end
  end


  # Add more helper methods to be used by all tests here...
end
