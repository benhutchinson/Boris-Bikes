require './lib/bike'

describe Bike do
  
  let(:broken_bike) { Bike.new }
  before(:each) do
    broken_bike.break!
  end

  it 'is not broken when created' do
    new_bike = Bike.new
    expect(new_bike).not_to be_broken
  end

  it 'can break' do
    broken_bike.break!
    expect(broken_bike).to be_broken
  end

  it 'can be fixed' do
    broken_bike.break!
    broken_bike.fix!
    expect(broken_bike).not_to be_broken
  end


end

