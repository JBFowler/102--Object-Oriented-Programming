# answers to ch2 exercises from OOP Book

def prompt(msg)
  puts "=> #{msg}"
end

# Question 1
prompt "1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off."
gets

class MyCar

  attr_accessor :speed

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(mph)
    self.speed += mph.to_i
    prompt "You accelerate to #{speed} mph."
  end

  def brake(mph)
    self.speed -= mph.to_i
    prompt "You slow down to #{speed} mph."
  end

  def turn_off
    self.speed = 0
    prompt "You turn off the car."
  end
end

rover = MyCar.new(2006, 'Mazda', '3s')
rover.speed_up(20)
rover.brake(10)
rover.turn_off
gets

#Question 2

prompt "2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car."
gets

class MyCar

  attr_accessor :speed, :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(mph)
    self.speed += mph.to_i
    prompt "You accelerate to #{speed} mph."
  end

  def brake(mph)
    self.speed -= mph.to_i
    prompt "You slow down to #{speed} mph."
  end

  def turn_off
    self.speed = 0
    prompt "You turn off the car."
  end
end

rover = MyCar.new(2006, 'Blue', 'Mazda 3')
rover.color = 'Green'
prompt rover.color
prompt rover.year
gets

#Question 3

prompt "3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car."
gets

class MyCar

  attr_accessor :speed, :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(mph)
    self.speed += mph.to_i
    prompt "You accelerate to #{speed} mph."
  end

  def brake(mph)
    self.speed -= mph.to_i
    prompt "You slow down to #{speed} mph."
  end

  def turn_off
    self.speed = 0
    prompt "You turn off the car."
  end

  def spray_paint(color)
    self.color = color
    prompt "Your car is now #{color}"
  end
end

rover = MyCar.new(2006, 'Blue', 'Mazda 3')
rover.spray_paint('Green')