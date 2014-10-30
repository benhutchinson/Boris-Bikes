# this will define the Garage tests
# it follows an equivalent template to DockingStation

require 'garage'
# require 'bike'

describe 'Garage' do

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
  

end

