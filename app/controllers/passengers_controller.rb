class PassengersController < ApplicationController
  def destroy
    # passenger = Passenger.find(params[:id])
    # passenger.destroy
    # redirect_to "/flights/#{passenger.flight_id}"

    gone = PassengerFlight.where(flight_id: params[:flight_id], passenger_id: params[:id]).first
    gone.destroy
    redirect_to "/flights"
  end
end
