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
WINNERS = [['rock', 'scissors'], ['paper', 'rock'], ['scissors', 'paper']]
TIE = [['rock', 'rock'], ['paper', 'paper'], ['scissors', 'scissors']]

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      n = ""
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
    else
      self.name = ['R2D2', 'John', 'Master Chief', 'C3P0', 'WALL-E'].sample
    end
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

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    if WINNERS.include? [human.move, computer.move]
      puts "#{human.name} beat the computer!"
    elsif TIE.include? [human.move, computer.move]
      puts "It's a tie!"
    else
      puts "#{computer.name} won..."
    end
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