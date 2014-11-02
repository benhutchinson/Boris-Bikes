class Person

  def initialize(bike= nil)
    @bike = bike
  end

  def has_bike?
    !@bike.nil?
  end

  def fall_down!
    @bike.break!
  end

  def get_rid_of_the_bike
    @bike = nil
  end

  def lose_bike!
    get_rid_of_the_bike
  end

  def rent_bike_from(station)
    @bike = station.release
  end

  def return_bike_to(bike, station)
    station.dock(bike)
    get_rid_of_the_bike
  end

end
