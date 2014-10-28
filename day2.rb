class Car

def initialize(make)
  @make = make
end

def start
  puts "#{@make} starting .."
  puts "vooommmmm...."

end

end

ford = Car.new("Ford")
puts ford
ford.start