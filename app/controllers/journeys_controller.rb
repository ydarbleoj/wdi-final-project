class JourneysController < ApplicationController
  respond_to :json

  def index
    @journeys = Journey.all

    respond_with sorted_journeys: @journeys, #will make a trending algorithm for this
                 following_journeys: current_user.followed_users, # BUG user_instance.followed_users always returns an empty array
                 current_user_journeys: current_user.journeys
  end

  def new
    @journey = current_user.journeys.build
  end

  def create
    journey_params = params.require(:journey).permit(:title, :start_date, :end_date)

    respond_with current_user.journeys.create(journey_params)

    # redirect_to journey_path(journey)
  end

  def edit
    @journey = Journey.find(params[:id])
    render :new
  end

  def update
    journey = Journey.find(params[:id])
    updated_params = params.require(:journey).permit(:title, :start_date, :end_date)

    respond_with journey.update_attributes(updated_params)
  end

  def show
    @journey = Journey.find(params[:id])

    respond_with @journey
  end

  def destroy
    respond_with Journey.find(params[:id]).destroy

    # redirect_to root_path

  end
end