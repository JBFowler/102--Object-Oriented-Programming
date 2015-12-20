# Rock, Paper, Scissors is a two-player game where each player chooses one of three possible moves: rock, paper, or scissors. The chosen moves will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# Nouns: player, move, rule
# Verbs: choose, compare

# Player
#  - choose
# Move
# Rule

# - compare

# Answer to questions from refactoring 1

# Is this design, with Human and Computer sub-classes, better? Why, or why not?
# This design is better, it is much cleaner and allows the superclass to only have methods available to both classes, and the subclasses to have their methods to themselves.

# What is the primary improvement of this new design?
# The primary improvement is allowing the subclasses to have only the functionality they need.

# What is the primary drawback of this new design?
# The primary drawback is adding additional classes, which may add to the complexity of the program at first look, but after understanding what is going on, it actually simplifies it.

# Answer to questions from refactoring 2

# What is the primary improvement of this new design?
# The primary improvement is cleaning up the code by allowing the move to be an object and determing the winner in a seperate class from the PRSGame class.

# What is the primary drawback of this new design?
# The primary drawback is that it adds a fair amount of complexity to the program.
#----------------------------------------------------------------------------------------------------------------------------------------

# CHOICES = ['rock', 'paper', 'scissors']
# WINNERS = [['rock', 'scissors'], ['paper', 'rock'], ['scissors', 'paper']]
# TIE = [['rock', 'rock'], ['paper', 'paper'], ['scissors', 'scissors']]

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end

  def >(other_move)
    if rock?
      return true if other_move.scissors?
      return false
    elsif paper?
      return true if other_move.rock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return false
    end
  end

  def <(other_move)
    if rock?
      return true if other_move.paper?
      return false
    elsif paper?
      return true if other_move.scissors?
      return false
    elsif scissors?
      return true if other_move.rock?
      return false
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      # break if CHOICES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'John', 'Master Chief', 'C3P0', 'WALL-E'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    # self.move = CHOICES.sample
  end
end

class RPSGame

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    if human.move > computer.move
      puts "#{human.name} beat the computer!"
    elsif human.move < computer.move
      puts "#{computer.name} won..."
    else  
      puts "It's a tie!"
    end
    # if WINNERS.include? [human.move, computer.move]
    #   puts "#{human.name} beat the computer!"
    # elsif TIE.include? [human.move, computer.move]
    #   puts "It's a tie!"
    # else
    #   puts "#{computer.name} won..."
    # end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would #{human.name} like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer
      puts "Please enter a valid answer (y/n)."
    end

    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play