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

CHOICES = ['rock', 'paper', 'scissors']

class Player
  attr_accessor :move

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if CHOICES.include? choice
        puts "Sorry, invalid choice."
      end
      self.move = choice
    else
      self.move = CHOICES.sample
    end
  end

  def human?
    @player_type == :human
  end
end

# class Move
#   def initialize
    
#   end
# end

# class Rule
#   def initialize
    
#   end
# end

# def compare(move1, move2)
  
# end

class RPSGame

  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end
  
  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play