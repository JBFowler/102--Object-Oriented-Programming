# answers to ch4 exercises from OOP Book

def prompt(msg)
  puts "=> #{msg}"
end

# question 1

prompt "1. Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles. Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way."
gets

class Vehicle
  attr_accessor :color
  attr_reader :model, :year

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

  def self.mpg(miles, gallons)
    prompt "Your car gets #{miles / gallons} miles per gallon."
  end

  def spray_paint(color)
    self.color = color
    prompt "Your car is now #{color}"
  end
end

class MyCar < Vehicle
  TOWING_CAPACITY = 500

  attr_accessor :color, :year, :model

end

class MyTruck < Vehicle
  TOWING_CAPACITY = 5000

  attr_accessor :color, :year, :model

end

# Question 2

prompt "2. Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well."

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
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

  def self.mpg(miles, gallons)
    prompt "Your car gets #{miles / gallons} miles per gallon."
  end

  def spray_paint(color)
    self.color = color
    prompt "Your car is now #{color}"
  end

  def self.vehicle_total
    prompt @@number_of_vehicles
  end
end

class MyCar < Vehicle
  # TOWING_CAPACITY = 500

  attr_accessor :color, :year, :model

end

class MyTruck < Vehicle
  # TOWING_CAPACITY = 5000

  attr_accessor :color, :year, :model

end

# Question 3

prompt "3. Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass."
gets

module OffRoad
  def can_it_go_offroad?(drivetrain)
    drivetrain == '4WD' ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
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

  def self.mpg(miles, gallons)
    prompt "Your car gets #{miles / gallons} miles per gallon."
  end

  def spray_paint(color)
    self.color = color
    prompt "Your car is now #{color}"
  end

  def self.vehicle_total
    prompt @@number_of_vehicles
  end
end

class MyCar < Vehicle
  # TOWING_CAPACITY = 500

  attr_accessor :color, :year, :model

end

class MyTruck < Vehicle
  include OffRoad

  # TOWING_CAPACITY = 5000

  attr_accessor :color, :year, :model

end

# Question 4

prompt "4. Print to the screen your method lookup for the classes that you have created."
gets

module OffRoad
  def can_it_go_offroad?(drivetrain)
    drivetrain == '4WD' ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
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

  def self.mpg(miles, gallons)
    prompt "Your car gets #{miles / gallons} miles per gallon."
  end

  def spray_paint(color)
    self.color = color
    prompt "Your car is now #{color}"
  end

  def self.vehicle_total
    prompt @@number_of_vehicles
  end
end

class MyCar < Vehicle
  # TOWING_CAPACITY = 500

  attr_accessor :color, :year, :model

end

class MyTruck < Vehicle
  include OffRoad

  # TOWING_CAPACITY = 5000

  attr_accessor :color, :year, :model

end

prompt MyTruck.ancestors
prompt MyCar.ancestors
prompt Vehicle.ancestors

# Question 5

prompt "5. Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished."
gets

module OffRoad
  def can_it_go_offroad?(drivetrain)
    drivetrain == '4WD' ? true : false
  end
end

class Vehicle
  attr_accessor :color, :speed
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
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

  def self.mpg(miles, gallons)
    prompt "Your car gets #{miles / gallons} miles per gallon."
  end

  def spray_paint(color)
    self.color = color
    prompt "Your car is now #{color}"
  end

  def self.vehicle_total
    prompt @@number_of_vehicles
  end
end

class MyCar < Vehicle
  # TOWING_CAPACITY = 500

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
  include OffRoad

  # TOWING_CAPACITY = 5000

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

rover = MyCar.new(2006, 'Blue', 'Mazda 3')
rover.speed_up(20)
rover.brake(10)
rover.turn_off
MyCar.mpg(200, 15)
rover.spray_paint('Green')
puts rover
prompt MyTruck.ancestors
prompt MyCar.ancestors
prompt Vehicle.ancestors

# Question 6

prompt "6. Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help."
gets

module OffRoad
  def can_it_go_offroad?(drivetrain)
    drivetrain == '4WD' ? true : false
  end
end

class Vehicle
  attr_accessor :color, :speed
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
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

  def self.mpg(miles, gallons)
    prompt "Your car gets #{miles / gallons} miles per gallon."
  end

  def spray_paint(color)
    self.color = color
    prompt "Your car is now #{color}"
  end

  def self.vehicle_total
    prompt @@number_of_vehicles
  end

  def age
    "Your #{self.model} is #{calculate_age} years old."
  end

  private

  def calculate_age
    Time.now.year - self.year
  end

end

class MyCar < Vehicle
  # TOWING_CAPACITY = 500

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
  include OffRoad

  # TOWING_CAPACITY = 5000
end

rover = MyCar.new(2006, 'Blue', 'Mazda 3')
prompt rover.age

# Question 7

prompt "7. Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so..."
gets

class Student

  attr_reader :name

  def initialize(n, g)
    @name = n
    @grade = g    
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 95)
bob = Student.new("Bob", 88)
puts "Well done!" if joe.better_grade_than?(bob)

# Question 8

prompt "8. What is the problem and how would you go about fixing it?"
gets

prompt "The problem is you are calling a private method from the class Person.  You need to make the method public in order to call it."
