class UsersController < ApplicationController
  respond_to :json
  def get_current_user
    respond_with current_user
  end
end