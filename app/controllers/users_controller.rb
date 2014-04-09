class UsersController < ApplicationController
  before_filter :authenticate_user!

  # respond_to :json
  def get_current_user
    respond_to do |f|
      f.json { render json: { user: current_user, full_name: current_user.full_name } }
    end
  end

end
