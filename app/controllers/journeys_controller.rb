class JourneysController < ApplicationController

  def index
    # @journeys = Journey.all
  end

  def new
    @journey = Journey.new
  end

  def create
    new_journey = params.require(:journey).permit(:title, :start_date, :end_date)

    journey = Journey.create(new_journey)

    redirect_to journey
  end

  def show
    @journey = Journey.find(params[:id])
  end
end