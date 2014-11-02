require './lib/docking'
require './lib/bike_container'
require_relative 'bike_container_spec'

describe DockingStation do

  it_behaves_like 'a Bike Container'

  let(:broken_bike) {double :bike, :broken? => true, :is_a? => true}
  let(:working_bike) {double :bike, :broken? => false, :is_a? => true}
  let(:station) { DockingStation.new(:capacity => 123) }
  let(:van) {double :van, :arrives_at_docking? => true}

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should start out with zero broken bikes" do
    brokencount = station.bikes.select {|bike| bike.broken?}.count
    expect(brokencount).to eq 0
  end

  it "should know if it has broken bikes" do
    station.dock(broken_bike)
    station.dock(working_bike)
    # expect(station.bike_count).to eq 2
    expect(station.has_broken_bikes?).to be true
  end 

  # it "should transfer and no longer have the bikes the van picks up" do
  #   station.dock(broken_bike)
  #   station.dock(working_bike)
  #   expect(station.has_broken_bikes?).to be true
  #   expect(van.arrives_at_docking?).to be true
  #   station.transfers_bikes_away
  #   expect(station.has_broken_bikes?).to be false
  #   expect(station.bikes_in_transit.count).to be 1
  # end

end

