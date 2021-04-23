class FlightsController < ApplicationController
  def index
    @flight = Flight.find(params[:id])
    @airline = @flight.airline 
  end
end
