class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights   ##

  # def unique_adults
  #   self.passengers.distinct.where(passengers: {age: >= 18})
  # end

  def unique_adults
    self.passengers.distinct.order(name: :asc).where('age >= 18')
  end

end
