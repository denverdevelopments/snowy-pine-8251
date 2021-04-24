class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @flights = @airline.flights

    @sorted_passengers = @airline.unique_adults ##new

    # @sorted_passengers = @airline.passengers.order(name: :asc).where('age >= 18')
    # @sorted_passengers = @flights.passengers_screened ##no
  end
end
