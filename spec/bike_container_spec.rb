require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }
  let(:fiction_bike) {Bike.new }
  let(:donkey) {Object.new}

  def fill_holder(holder)
    holder.capacity.times { holder.dock(Bike.new) }
  end

  it 'Should only dock or release bikes; no other kinds of things' do
    expect{ holder.dock(donkey) }.to raise_error(BikesOnlyError)
  end

  it "should accept a bike" do
    # we expect the holder to have 0 bikes
    expect(holder.bike_count).to eq(0)
    # let's dock a bike into the holder
    holder.dock(bike)
    # now we expect the holder to have 1 bike
    expect(holder.bike_count).to eq(1)
  end

  it 'Should release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it 'Should not release a bike that is not there' do
    # holder.dock(bike) # code not necessary, was just to aid my understanding
    # that bike and fiction_bike are two different instance objects generated from the Bike class
    expect { holder.release(fiction_bike) }.to raise_error(NoBikeError)
  end

  it "Should know when it's full" do
    expect(holder).not_to be_full
    fill_holder holder
    expect(holder).to be_full
    expect(holder.empty?).to be false
  end

  it "Should not accept a bike if it's full" do
    fill_holder holder
    expect{ holder.dock(bike) }.to raise_error(HolderFull)
  end

  it "Should provide the list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it "Should know when it is empty" do
    expect(holder.empty?).to be true
  end

end