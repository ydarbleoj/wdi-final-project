class UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def show
    user = this_user
    profile_user = user.as_json
    profile_user["journeys_count"] = user.journeys.count
    profile_user["followers_count"] = user.followers.count
    journeys = user.journeys
    posts = user.all_posts

    respond_to do |f|
      f.json {render json: { user: profile_user, journeys: journeys, posts: posts }}
    end

  end

  def get_current_user
    respond_with [ current_user ]
  end

  def following
    respond_with this_user.following
  end

  def followers
    respond_with this_user.followers
  end

  private

    def this_user
      User.find(params[:id])
    end


end
