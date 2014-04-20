class JourneysController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    journeys = Journey.all

    respond_with current_user.journeys
    # respond_with sorted_journeys: journeys, #TODO make a trending algorithm for this
    #
    #              following_journeys: current_user.following,
    #
    #              # TODO split ths out into a separate method so current_user
    #              # can have authentication distinct from all users/no user
    #              current_user_journeys: current_user.journeys
  end


  def create
    journey_params = params.require(:journey).permit(:title, :start_date, :end_date)

    respond_with current_user.journeys.create(journey_params)

  end

  def update
    journey = Journey.find(params[:id])
    updated_params = params.require(:journey).permit(:title, :start_date, :end_date)

    respond_with journey.update_attributes(updated_params)
  end

  def show
    journey = Journey.find(params[:id]);

    respond_with journey
  end

  def destroy
    respond_with Journey.find(params[:id]).destroy
  end
end
