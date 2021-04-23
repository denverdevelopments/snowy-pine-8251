require 'rails_helper'

RSpec.describe 'flight index page' do
  before(:each)do
    @airline_1 = Airline.create!(name: "United")
    @flight_1 = @airline_1.flights.create!(number: “1727”, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @passenger_1 = Passenger.create!(name: "Tim", age: 18)
    @passenger_2 = Passenger.create!(name: "Jill", age: 31)
    @passenger_3 = Passenger.create!(name: "Pat", age: 17)

    @flight_1.passengers << @passenger_1, @passenger_3, @passenger_5

    @flight_2 = @airline_1.flights.create!(number: “3125”, date: "11/23/20", departure_city: "Phoenix", arrival_city: "Fargo")
    @passenger_4 = Passenger.create!(name: "Joe", age: 9)
    @passenger_5 = Passenger.create!(name: "Katie", age: 28)

    @flight_2.passengers << @passenger_2, @passenger_4

    @airline_2 = Airline.create!(name: "Delta")
    @flight_3 = @airline_2.flights.create!(number: “1727”, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @passenger_6 = Passenger.create!(name: "Bill", age: 19)
    @passenger_7 = Passenger.create!(name: "Jan", age: 35)
    @passenger_8 = Passenger.create!(name: "Doris", age: 11)

    @flight_3.passengers << @passenger_6, @passenger_7, @passenger_8

  end
  # Airlines have a name
  # Ex: name: “Frontier”
  # Flights have a number, date, departure city, and arrival city
  # Ex: number: “1727”, date: “08/03/20”, departure_city: “Denver”, arrival_city: “Reno” -- for this app, it does not matter how you format the flight’s date
  # Passengers have a name and age
  # Ex: name: “Joe”, age: 7

  it 'lists all flight numbers' do
    visit "/flights/"

within("#chef_dishes") do
  within("#dish-#{dish1.id}") do
    expect(page).to have_content("#{dish1.name}")
    expect(page).to have_content("#{dish1.description}")
  end

  end

  it 'lists each flight number Airline name' do

  end

  it 'lists all flight number passenger names' do

  end

end
