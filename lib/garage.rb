# this will refer to the Garage class
# this follows the DockingStation template below.


# load BikeContainer
require_relative 'bike_container'

class Garage

  # this gives us all the methods 
  # that are to be used in this class
  include BikeContainer


  def initialize(options = {})
    # self.capacity is calling the capacity=() method
    # (note the equals sign) defined in BikeContainer

    # capacity (the second argument to fetch()) is calling
    # the capacity() method in BikeContainer

    self.capacity=(options.fetch(:capacity, capacity))

  end

  def fix_bikes
    bikes.map { |bike| bike.fix! }
  end

  def accept(bike)
    bike.fix!
    dock(bike)
  end

  def has_fixed_bikes?
    fixed_bikes = bikes.select { |bike| !bike.broken?}
    !fixed_bikes.empty?
  end

  def all_bikes_fixed?
    true if bikes.select { |bike| !bike.broken?} == bikes
  end


end