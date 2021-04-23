class FlightsController < ApplicationController
  def index
    @flights = Flight.all 
    # @flight = Flight.find(params[:id])
    # @airline = @flight.airline
  end
end
