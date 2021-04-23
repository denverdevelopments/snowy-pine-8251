class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @flights = @airline.flights

    @sorted_passengers = @airline.unique_adults
    # binding.pry
    # @passengers = @airline.passengers.order(name: :asc).where('age >= 18')

  end
end
