class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @flights = @airline.flights 
  end
end
