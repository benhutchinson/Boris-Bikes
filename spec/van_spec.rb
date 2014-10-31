# this will define the Van tests
# it follows an equivalent template to DockingStation

require './lib/van'
require_relative 'bike_container_spec'

describe Van do

  it_behaves_like "a Bike Container"

  let(:van) { Van.new(:capacity => 80) }

  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(80)
  end


end

