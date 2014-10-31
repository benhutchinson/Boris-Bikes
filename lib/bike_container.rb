class NoBikeError < Exception
  def message
    "Bike not here"
  end
end

class HolderFull < Exception
  def message
    "The container is full"
  end
end

class BikesOnlyError < Exception
  def message
    "Please only use bikes, no other objects"
  end
end

################################################
# this is the Module file
################################################

module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise BikesOnlyError unless bike.is_a?(Bike) || bike.is_a?(Symbol)
    raise HolderFull if full?
    bikes << bike
  end

  def release(bike)
    raise NoBikeError unless bikes.include?(bike)
    bikes.delete(bike)  
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end

  def empty?
    bike_count == 0
  end

  def has_broken_bikes?
    arr = bikes.select {|bike| bike.broken?}
    !arr.empty?
    # i.e. if it has broken bikes, returns true
    # empty is negated here, since selecting
    # an array that does actually contain
    # broken instances.
  end

end