class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights, dependent: :destroy

  # def passengers_screened
  #   self.joins(:passengers)
  #       .where(passengers: {age: >= 18})
  #       .distinct
  # end
end
