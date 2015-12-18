# answers to ch3 exercises from OOP Book

def prompt(msg)
  puts "=> #{msg}"
end

# question 1

prompt "1. Add a class method to your MyCar class that calculates the gas mileage of any car."
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

  def self.mpg(miles, gallons)
    prompt "Your car gets #{miles / gallons} miles per gallon."
  end
end

MyCar.mpg(200, 15)
gets

# question 2

prompt "2. Override the to_s method to create a user friendly print out of your object."
gets

class MyCar

  attr_accessor :year, :color, :model

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

  def to_s
    puts "Your #{year} #{model} is #{color}."
  end
end

rover = MyCar.new('2006', 'Blue', 'Mazda 3')
puts rover
gets

# Question 3

prompt "3. Why do we get this error and how to we fix it?"
gets

prompt "You get the error because you do not have access to writing to the instance variable.  You need either attr_writer or attr_accessor."
gets

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
prompt bob.name
