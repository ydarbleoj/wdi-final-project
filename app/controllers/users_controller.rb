class UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  def get_current_user
    respond_with current_user
  end
end