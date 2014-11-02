require 'person'

describe Person do

let(:person_without_bike) { Person.new }
let(:bike) { double :bike }
let(:person_with_bike) { Person.new(bike) }
let(:old_street) { double :docking_station }

# the bike double is being created
# it is acting as an instance of another class
# it may or may not have been created
# we are testing its response to certain messages


  it 'it has no bike when initialized' do
    expect(person_without_bike).not_to have_bike
  end

  it 'can have a bike' do
    expect(person_with_bike).to have_bike
  end

  it 'can break a bike' do
    expect(bike).to receive(:break!)
    # argument for receive is always a method
    # here break! is the argument
    person_with_bike.fall_down!
  end

  it 'can lose the bike' do
    person_with_bike.lose_bike!
    expect(person_with_bike).not_to have_bike
  end

  it 'can rent a bike from a docking station' do
    expect(old_street).to receive(:release)
    person_without_bike.rent_bike_from(old_street)
  end

  it 'actually has a bike after renting it' do
    allow(old_street).to receive(:release).and_return(bike)
    person_without_bike.rent_bike_from(old_street)
    expect(person_without_bike).to have_bike
  end

  it 'can return a bike to a station' do
    expect(old_street).to receive(:dock).with(bike)
    person_with_bike.return_bike_to(bike, old_street)
  end

  it 'does not have the bike after docking' do
    allow(old_street).to receive(:dock).with(bike)
    person_with_bike.return_bike_to(bike, old_street)
    expect(person_with_bike).not_to have_bike
  end 

end