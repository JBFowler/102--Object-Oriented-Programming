# Answers for Easy 3 Exercises

# Answer 1
puts "1. Case 1: 'Hello'  Case 2: Undefined method error   Case 3: Wrong number of arguments   Case 4: 'Goodbye'   Case 5: Undefined method error"
gets

# Answer 2
puts "2. Prepend self to hi method and create a new Hello object.  See code in editor."

class Hello
  def self.hi
    hello = Hello.new
    hello.greet("Hello")
  end
end

gets

# Answer 3
puts "3. 'tom = AngryCat.new(10, 'Tom Cat')' 'jim = AngryCat.new(5, 'Jim Cat')'"
gets

# Answer 4
puts "4. See code in editor"

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    puts "I am a #{type} cat."
  end
end

gets

# Answer 5
puts "5. The tv.manufacture would return an undefined method error. The tv.model method would return nothing.  The exact opposite would happen for the other two methods."
gets

# Answer 6
puts "6. You could use @age instead, as the self.age method is given by attr_accessor."
gets

# Answer 7
puts "7. The return in self.information.  The final line is what's automatically returned for any method unless otherwise stated, so this is not needed."