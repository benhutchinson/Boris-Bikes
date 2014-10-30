# this will define the Van tests
# it follows an equivalent template to DockingStation

require 'van'

describe 'Van' do

  let(:van) { Van.new(:capacity => 80) }

  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(80)
  end


end

