require 'rails_helper'

RSpec.describe Passenber, type: :model do
  describe "relationships" do
    it {should have_many :passenger_flights}
    it {should have_many(:flights).through(:passenger_flights)}
  end 
end
