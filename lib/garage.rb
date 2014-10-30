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


end