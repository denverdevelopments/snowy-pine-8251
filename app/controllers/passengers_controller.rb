class PassengersController < ApplicationController
  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to "/flights/#{passenger.flight_id}"

    # di = DishIngredient.where(ingredient_id: params[:ingredient_id], dish_id: params[:id]).first
    # di.destroy
    # redirect_to "/ingredients/#{params[:ingredient_id]}"
end
