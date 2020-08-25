class StaticsController < ApplicationController
  def page
    @user = User.new
  end
end
