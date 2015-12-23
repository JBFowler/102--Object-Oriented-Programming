# Answers for Easy 1 Exercises

# Question 1
puts "1. Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?"

objects_prompt = <<-MSG
  1) true
  2) "hello"
  3) [1, 2, 3, "happy days"]
  4) 142
MSG

puts objects_prompt
gets

puts "All of these are objects.  You can find there class by calling '.class' on them."
gets

# Question 2
puts "2. If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed. How can you check if your Car or Truck can now go fast?"
gets

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

rover = Car.new
nissan = Truck.new
rover.go_fast
nissan.go_fast
gets

# Question 3
puts "3. When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?"
gets

puts "We used the self.class method to retrieve the class of the object.  Both objects had either the class 'Car' or 'Truck'.  The method was called on the object inside a string, so string interpolation was used and to_s was automatically called on the class name."
gets

# Question 4
puts "4. If we have a class AngryCat how do we create a new instance of this class? The AngryCat class might look something like this:"

angry_cat_prompt = <<-MSG

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end
MSG

puts angry_cat_prompt
gets

puts "AngryCat.new"
gets

# Question 5
puts "5. Which of these two classes has an instance variable and how do you know?"

question_five_prompt = <<-MSG

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
MSG

puts question_five_prompt
gets

puts "The 'Pizza' class has an instance variable called '@name'.  You can tell because it has the @ symbol in front of it.  The 'Fruit' class has a local variable instead."
gets

# Question 6
puts "6. What could we add to the class below to access the instance variable @volume?"

question_six_prompt = <<-MSG

class Cube
  def initialize(volume)
    @volume = volume
  end
end
MSG

puts question_six_prompt
gets

puts "'attr_accessor :volume' or a method called volume which simply returned the instance variable @volume."
gets

# Question 7
puts "7. What is the default thing that Ruby will print to the screen if you call to_s on an object? Where could you go to find out if you want to be sure?"
gets

puts "It would print the objects class and the objects id."
gets

# Question 8, questions were ommited from here on.
puts "8. self.age is the setter method for the @age instance variable.  The method is given to us by attr_accessor :age.  self represents the calling object."
gets

# Question 9
puts "9. The self refers to the class in this instance."
gets

# Question 10
puts "10. Bag.new('Blue', 'Leather')"

