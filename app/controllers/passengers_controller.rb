class PassengersController < ApplicationController
  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to "/flights/#{passenger.flight_id}"
end
