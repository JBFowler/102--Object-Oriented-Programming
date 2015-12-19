# Questions from Inheritance in Lesson 2

# Question 1

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

# Question 2

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    "swimming!"
  end

  def fetch
    "fetching!"
  end
end

# Question 3

#        Pet
#      -------
#        run
#        jump
#        |  |
#       |    |
#      |      |
#     |        |
#    |          |
#   |            |
#  |              |
# Dog            Cat
#------       ---------
# fetch         speak
# speak
# swim
#  |
#  |
#  |
# Bulldog
#---------
# swim

# Question 4

The method lookup path is the order in which the object looks through its classes and modules to see which method it should use.  It goes in the order of its class, then module if one exists, then every superclass from there on up.  You can find this by calling the .ancestors method.