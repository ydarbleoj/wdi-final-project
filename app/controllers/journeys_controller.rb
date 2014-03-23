class JourneysController < ApplicationController

  def index
    @journeys = Journey.all
  end

  def new
    @journey = current_user.journeys.build
  end

  def create
    journey_params = params.require(:journey).permit(:title, :start_date, :end_date)

    journey = current_user.journeys.create(journey_params)

    redirect_to journey_path(journey)
  end

  def edit
    @journey = Journey.find(params[:id])
    render :new
  end

  def update
    journey = Journey.find(params[:id])
    updated_params = params.require(:journey).permit(:title, :start_date, :end_date)
    journey.update_attributes(updated_params)

    redirect_to journey_path(journey)
  end

  def show
    @journey = Journey.find(params[:id])
  end

  def destroy
    Journey.find(params[:id]).destroy

    redirect_to root_path

  end
end