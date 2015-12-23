# Answers for Easy 3 Exercises

# Question 1
puts "1. Ben is right.  By using attr_reader :balance he is given a getter method called balance that will return the instance variable."
gets

# Question 2
puts "2. The mistake is in the quantity variable.  Due to attr_reader, this is a method that returns the @quantity instance variable, but does not allow you to set the instance variable. You would need attr_accessor to do both, and you would call self.quantity to set it."
gets

# Question 3
puts "3. The only problem is that you are somewhat superceding the update_quantity method by giving the object access to self.quantity, which gives the object the ability to set the quantity without having to go through the update_quantity method."
gets

# Question 4
puts "4. See code for answer."

class Greeting
  def greet(str)
    puts str
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

gets

# Question 5
puts "5. See code for answer."

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    # if filling_type.nil? && glazing.nil?
    #   "Plain"
    # elsif glazing.nil?
    #   "#{filling_type}"
    # elsif filling_type.nil?
    #   "Plain with #{glazing}"
    # else
    #   "#{filling_type} with #{glazing}"
    # end
    filling_string = filling_type ? filling_type : "Plain"
    glazing_string = glazing ? " with #{glazing}" : ''
    filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

gets

# Question 6
puts "6. The code works the same way but you should avoid using self when you don't have to."
gets

# Question 7
puts "7. You could call the method 'information' since you are going to be calling the class name 'Light' already."
gets