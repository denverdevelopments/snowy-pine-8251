require 'rails_helper'

RSpec.describe 'airline show page' do
  before(:each)do
  @airline_1 = Airline.create!(name: "United")
  @flight_1 = @airline_1.flights.create!(number: “1727”, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
  @passenger_1 = Passenger.create!(name: "Tim", age: 18)
  @passenger_2 = Passenger.create!(name: "Jill", age: 31)
  @passenger_3 = Passenger.create!(name: "Pat", age: 17)

  @flight_1.passengers << @passenger_1
  @flight_1.passengers << @passenger_3
  @flight_1.passengers << @passenger_5

  @flight_2 = @airline_1.flights.create!(number: “3125”, date: "11/23/20", departure_city: "Phoenix", arrival_city: "Fargo")
  @passenger_4 = Passenger.create!(name: "Joe", age: 9)
  @passenger_5 = Passenger.create!(name: "Katie", age: 28)

  @flight_2.passengers << @passenger_2
  @flight_2.passengers << @passenger_4
  end

  it 'lists passengers that have flights on that airline' do

    visit "/airlines/#{@airline_1.id}"

    expect(page).to have_content("#{@passenger_1.name}")
    expect(page).to have_content("#{@passenger_3.name}")
    expect(page).to have_content("#{@passenger_5.name}")
  end

  it 'list of airline passengers is unique & age >= 18' do
  end

end
