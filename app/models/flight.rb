class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights, dependent: :destroy

  # def passengers_screened
  #   self.joins(:passengers)
  #       .where(passengers: {age: >= 18})
  #       .distinct
  # end

  def passengers_screened
    # self.joins(:passengers).where(passengers: {'age >= 18'}).distinct   #no
    # self.passengers.where(passengers: {'age >= 18'}).distinct   #no
    self.passengers.where('age >= 18').distinct   #yes
  end
end

# <% @flights.each do |flight| %>
#     <% flight.passengers_screened.each do |passenger| %>
#       <p><%= passenger.name %> </p>
#     <% end %>
# <% end %>
