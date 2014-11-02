# this will refer to the Van class
# this follows the DockingStation template below.


# load BikeContainer
require_relative 'bike_container'

class Van

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

  def arrives_at_docking(station)
    if station.has_broken_bikes?
      true
    else
      false
    end
  end

  def arrives_at_garage(station)
    station.has_fixed_bikes?
  end

  def releases_bikes_to_garage(garage)
    garage.accept(bikes)
    bikes.clear
    true
  end

  def takes_fixed_bikes
    dock(garage.bikes_for_transfer)
    true
  end

  def releases_bikes_to_docking_station(station)
    station.dock(bikes)
    bikes.clear
  end

  def takes_broken_bikes
    dock(station.bikes_for_transfer)
  end

end