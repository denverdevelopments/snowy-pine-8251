class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights   ##new

  # def sort_unique_adults
  #   self.passengers.distinct.where(passengers: {age: >= 18})
  # end

  def unique_adults   ##new
    self.passengers.distinct.where('age >= 18').order(name: :asc) #('passenger.flights.count desc') 
  end

  # def unique_adults   ##new w. most trips first
  #   self.passengers.distinct.where('age >= 18').select('passengers.*, passenger.flights.count as trips').order(trips: :desc)
  # end

end
