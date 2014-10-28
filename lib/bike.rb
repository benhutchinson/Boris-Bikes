class Bike

  def initialize
    fix!
  end

  def broken?
    @broken
    # otherwise, is returning nil
  end

  def break!
    @broken = true
  end

  def fix!
    @broken = false
  end


end