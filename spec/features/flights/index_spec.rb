require 'rails_helper'

RSpec.describe 'flight index page' do
  before(:each)do
    @airline_1 = Airline.create!(name: "United")
    @flight_1 = @airline_1.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @passenger_1 = Passenger.create!(name: "Tim", age: 18)
    @passenger_2 = Passenger.create!(name: "Jill", age: 31)
    @passenger_3 = Passenger.create!(name: "Pat", age: 17)
    @passenger_4 = Passenger.create!(name: "Joe", age: 9)
    @passenger_5 = Passenger.create!(name: "Katie", age: 28)

    @flight_1.passengers << @passenger_1
    @flight_1.passengers << @passenger_3
    @flight_1.passengers << @passenger_5

    @flight_2 = @airline_1.flights.create!(number: "3125", date: "11/23/20", departure_city: "Phoenix", arrival_city: "Fargo")

    @flight_2.passengers << @passenger_2
    # @flight_2.passengers << @passenger_4  ##removed remove test

    @airline_2 = Airline.create!(name: "Delta")
    @flight_3 = @airline_2.flights.create!(number: "4321", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @passenger_6 = Passenger.create!(name: "Bill", age: 19)
    @passenger_7 = Passenger.create!(name: "Jan", age: 35)
    @passenger_8 = Passenger.create!(name: "Doris", age: 11)

    @flight_3.passengers << @passenger_6
    @flight_3.passengers << @passenger_7
    @flight_3.passengers << @passenger_8
  end

  it 'lists all flight: numbers, Airline name, passengers' do
    visit "/flights"

    within("#flight_list") do
      within("#flight-#{@flight_1.id}") do
        expect(page).to have_content("#{@flight_1.number}")
        expect(page).to have_content("#{@flight_1.airline.name}")
        expect(page).to have_content("#{@passenger_1.name}")
        expect(page).to have_content("#{@passenger_3.name}")
        expect(page).to have_content("#{@passenger_5.name}")
      end

      within("#flight-#{@flight_2.id}") do
        expect(page).to have_content("#{@flight_2.number}")
        expect(page).to have_content("#{@flight_2.airline.name}")
        expect(page).to have_content("#{@passenger_2.name}")
      end

      within("#flight-#{@flight_3.id}") do
        expect(page).to have_content("#{@flight_3.number}")
        expect(page).to have_content("#{@flight_3.airline.name}")
        expect(page).to have_content("#{@passenger_6.name}")
        expect(page).to have_content("#{@passenger_7.name}")
        expect(page).to have_content("#{@passenger_8.name}")
      end
    end
  end

  it 'has button to remove passenger next to name' do
    visit "/flights"

    within("#flight_list") do
      within("#flight-#{@flight_2.id}") do

        expect(page).to have_content("#{@flight_2.number}")
        expect(page).to have_content("#{@passenger_2.name}")

        expect(page).to have_button("Remove Passenger")

        click_button("Remove Passenger")
        expect(current_path).to eq("/flights")
        expect(page).to_not have_content("#{@passenger_2.name}")
      end
    end
  end
end
