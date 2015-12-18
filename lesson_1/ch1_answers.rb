# answers to ch1 exercises from OOP Book

def prompt(msg)
  puts "=> #{msg}"
end

def question1
  prompt "1. How do we create an object in Ruby? Give an example of the creation of an object."
  prompt "class NewClass"
  prompt "end"
  prompt "object = NewClass.new"
  gets
end

def question2
  prompt "2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly."
  prompt "A module is used to add methods to classes based on their need for them.  For instance, you can create a module called Speak that has a method called speak and include it in your class.  You class may be a subclass of another class that only needs the method for some of it's subclasses, so it uses a module for that method instead."
  prompt "module NewModule"
  prompt "  def new_method"
  prompt "  end"
  prompt "end"
  prompt "class Newclass"
  prompt "  include NewModule"
  prompt "end"
  prompt "object = NewClass.new"
  prompt "object.new_method"
  gets
end

question1
question2