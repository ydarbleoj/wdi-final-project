class JourneysController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    respond_with current_user.followed_journeys
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
