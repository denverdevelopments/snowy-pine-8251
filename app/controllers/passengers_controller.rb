class PassengersController < ApplicationController
  def destroy
    gone = PassengerFlight.where(flight_id: params[:flight_id], passenger_id: params[:id]).first
    gone.destroy
    redirect_to "/flights"
  end
end
