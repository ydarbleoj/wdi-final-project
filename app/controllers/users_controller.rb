class UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def show
    user = User.find(params[:id])
    journeys = user.journeys
    posts = user.all_posts

    respond_to do |f|
      f.json {render json: { user: user, journeys: journeys, posts: posts }}
    end

  end

  def get_current_user
    respond_with [ current_user ]
  end


end
