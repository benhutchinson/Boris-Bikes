# this will define the Garage tests
# it follows an equivalent template to DockingStation

require './lib/garage'
require_relative 'bike_container_spec'
# require 'bike'

describe Garage do

  it_behaves_like 'a Bike Container'

  let(:garage) { Garage.new(:capacity => 1000) }
  let(:broken_bike) { Bike.new }

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(1000)
  end

  it "should fix the bikes it receives" do
    # to test, need to dock a broken bike
    broken_bike.break!
    garage.dock(broken_bike)
    garage.fix_bikes
    # after a broken bike is docked, must be fixed
    # therefore, expect all bikes to be available
    # ie. no remaining bikes are broken at the garage
    expect(garage.available_bikes).to eq garage.bikes
    ####### i can't get this to work.

  end

  it "v2. auto-fixes bikes on arrival" do
    broken_bike.break!
    garage.accept(broken_bike)
    expect(broken_bike).not_to be_broken
  end


end

