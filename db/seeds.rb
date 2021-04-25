# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PassengerFlight.destroy_all
Passenger.destroy_all
Flight.destroy_all
Airline.destroy_all

@airline_1 = Airline.create!(name: "United")
@flight_1 = @airline_1.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
@passenger_1 = Passenger.create!(name: "Tim", age: 18)
@passenger_2 = Passenger.create!(name: "Jill", age: 31)
@passenger_3 = Passenger.create!(name: "Pat", age: 17)
@passenger_4 = Passenger.create!(name: "Joe", age: 9)
@passenger_5 = Passenger.create!(name: "Katie", age: 28)
@passenger_9 = Passenger.create!(name: "Zoe", age: 88)

@flight_1.passengers << @passenger_1
@flight_1.passengers << @passenger_3
@flight_1.passengers << @passenger_5
@flight_1.passengers << @passenger_9

@flight_2 = @airline_1.flights.create!(number: "3125", date: "11/23/20", departure_city: "Phoenix", arrival_city: "Fargo")

@flight_2.passengers << @passenger_2
@flight_2.passengers << @passenger_4
@flight_2.passengers << @passenger_9

@airline_2 = Airline.create!(name: "Delta")
@flight_3 = @airline_2.flights.create!(number: "4321", date: "08/03/20", departure_city: "Seattle", arrival_city: "Boston")
@passenger_6 = Passenger.create!(name: "Bill", age: 19)
@passenger_7 = Passenger.create!(name: "Jan", age: 35)
@passenger_8 = Passenger.create!(name: "Doris", age: 11)

@flight_3.passengers << @passenger_6
@flight_3.passengers << @passenger_7
@flight_3.passengers << @passenger_8
