class Admins::UsersController < ApplicationController
  before_action :access_admin

  def index
  	@users = User.all
  end
end
