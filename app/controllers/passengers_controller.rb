class PassengersController < ApplicationController
  def destroy
    removed = PassengerFlight.where(flight_id: params[:flight_id], passenger_id: params[:id]).first
    removed.destroy
    redirect_to "/flights"
  end
end
