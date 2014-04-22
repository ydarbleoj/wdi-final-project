class JourneysController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    # TODO: batch this or something.
    # TODO: integrate privacy settings into this.
    respond_with Journey.all
  end

  def friends_journeys
    respond_with current_user.followed_journeys
  end

  def create
    respond_with current_user.journeys.create(journey_params)
  end

  def update
    respond_with current_journey.update_attributes(journey_params)
  end

  def show
    respond_with current_journey
  end

  def destroy
    respond_with current_journey.destroy
  end

  private
    def current_journey
      Journey.find(params[:id])
    end

    def journey_params
      params.require(:journey).permit(:title, :start_date, :end_date)
    end
end
