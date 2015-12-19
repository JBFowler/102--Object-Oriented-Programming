# Questions from Classes and Objects in Lesson 2

# Answer 1

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Answer 2

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    find_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

# Answer 3

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    names = full_name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    find_full_name(full_name)
  end

  private

  def find_full_name(full_name)
    names = full_name.split
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ''
  end
end

# Answer 4

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob.name == rob.name

# Answer 5

The person's name is: #<Person:0x007fb873252640>
The person's name is: Robert Smith