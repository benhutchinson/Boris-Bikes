# this will define the Van tests
# it follows an equivalent template to DockingStation

require './lib/van'
require_relative 'bike_container_spec'

describe Van do

  it_behaves_like "a Bike Container"

  let(:van) { Van.new(:capacity => 80) }
  let(:station_broken) { double :station, {:has_broken_bikes? => true}}
  let(:station_working) { double :station, {:has_broken_bikes? => false}}
  let(:garage) {double :garage}

  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(80)
  end

  it "arrives for broken bikes from docking station" do
    expect(van.arrives(station_broken)).to be true
  end

  it "but does not arrive if there are no broken bikes at the docking station" do
    expect(van.arrives(station_working)).to be false
  end

  # it "arrives to collect fixed bikes from garage" do
  #   expect(van.collect(station_broken)).to be true
  # end

  # it "but does not arrive if there are no broken bikes at the docking station" do
  #   expect(van.arrives(station_working)).to be false
  # end

end

