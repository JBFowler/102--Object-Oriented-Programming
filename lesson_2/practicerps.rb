
# Rock, Paper, Scissor, Lizard, Spock

# require 'pry'
# require 'pry-byebug'
require 'colorize'

module Utilities
  # Return an constantized object 
  # object is a string
  def self.constantize(object)
    Object.const_get(object)
  end
end

class Player
  attr_reader :name, :stats

  def initialize(name)
    @name = name
    @stats = PlayerStat.new
  end

  # Convert the players choice to the proper class
  # This is used as the players weapon of choice
  def choose_move(choice)
    klass = ValidWeapon.find_weapon_class(choice).new
    update_stats!(klass)

    klass
  end

  def update_stats!(weapon)
    stats.increment_move(weapon)
  end

  def to_s
    "#{name} the #{self.class}"
  end
end

class Human < Player
  def initialize
    super(input_name)
  end

  def choose_move
    choice = ''
    loop do
      prompt("Choose one: #{ValidWeapon.menu_options}")
      choice = gets.chomp
      break if ValidWeapon.valid_inputs_list.include?(choice)
      puts 'That is not a valid choice.'
    end

    super(choice)
  end

  private

  def input_name
    name = ''

    loop do
      prompt('Enter your name')
      name = gets.chomp
      break unless name.empty?
      puts 'Your name is required'
    end

    name
  end
end

class Computer < Player
  NAMES = %w(Hal KITT R2-D2 01100101)

  def initialize
    super(choose_name)
  end

  def choose_move
    move = ValidWeapon.valid_inputs_list.sample

    super(move)
  end

  private

  def choose_name
    NAMES.sample
  end
end

# ValidWeapon is the parent class for the various options that a player can choose.
class ValidWeapon
  include Utilities

  WEAPONS = %w(Rock Paper Scissor Lizard Spock) # create an array of available classes, as strings

  def beats?(other)
    wins_against.include?(other)
  end

  # wins_against returns an array of weapons class
  # objects that are losers against the calling object class
  def wins_against
    winners.map { |_, hash| Utilities.constantize(hash[:klass]) }
  end

  def victor_verb(other)
    winners[other.class.input_matcher][:message]
  end

  def to_s
    "#{self.class}"
  end

  # =========================================================================
  # These are class methods used to handle the output
  # and input of the players weapons selections.
  # --------------------------------------------------------------------------
  # create an array of input choices, i.e. ['r', 'p', 's'...]
  def self.valid_inputs_list
    WEAPONS.map { |weapon| Utilities.constantize(weapon).input_matcher }
  end

  # A class method used to return a string of weapons formatted for output
  # Rock (r), Paper (p)...
  def self.menu_options
    WEAPONS.map { |weapon| "#{weapon} (#{Utilities.constantize(weapon).input_matcher.red})" }.join(', ')
  end

  # returns the weapon class based on the player input, input == INPUT_MATCHER
  def self.find_weapon_class(input_weapon)
    WEAPONS.each do |weapon|
      weapon_class = Utilities.constantize(weapon)
      return weapon_class if weapon_class.input_matcher == input_weapon
    end
  end
  # =========================================================================
end

class Rock < ValidWeapon
  def winners
    {
      's' => { klass: 'Scissor', message: 'smashes' },
      'l' => { klass: 'Lizard', message: 'crushes' }
    }
  end

  def self.input_matcher
    'r'
  end
end

class Paper < ValidWeapon
  def winners
    {
      'r' => { klass: 'Rock', message: 'covers' },
      'sp' => { klass: 'Spock', message: 'disproves' }
    }
  end

  def self.input_matcher
    'p'
  end
end

class Scissor < ValidWeapon
  def winners
    {
      'p' => { klass: 'Paper', message: 'cuts' },
      'l' => { klass: 'Lizard', message: 'decapitates' }
    }
  end

  def self.input_matcher
    's'
  end
end

class Lizard < ValidWeapon
  def winners
    {
      'sp' => { klass: 'Spock', message: 'poisons' },
      'p' => { klass: 'Paper', message: 'eats' }
    }
  end

  def self.input_matcher
    'l'
  end
end

class Spock < ValidWeapon
  def winners
    {
      's' => { klass: 'Scissor', message: 'smashes' },
      'r' => { klass: 'Rock', message: 'vaporizes' }
    }
  end

  def self.input_matcher
    'sp'
  end
end

class PlayerStat
  attr_accessor :wins, :loses, :ties, :rock, :paper, :scissor, :lizard, :spock

  def initialize
    self.wins     = 0
    self.loses    = 0
    self.ties     = 0
    self.rock     = 0
    self.paper    = 0
    self.scissor  = 0
    self.lizard   = 0
    self.spock    = 0
  end

  def winner!
    self.wins += 1
  end

  def loser!
    self.loses += 1
  end

  def tied!
    self.ties += 1
  end

  def total_games
    wins + loses + ties
  end

  def win_percentage
    "#{calc_percentage(wins)}%"
  end

  def calc_percentage(frequency)
    ((frequency.to_f / total_games) * 100).round(2)
  end

  # weapon is an instance of a class object of type
  # Rock, Scissor, Paper, Lizard or Spock
  def increment_move(weapon)
    variable = "@#{weapon.to_s.downcase}"           # convert the class name of the move
    value = instance_variable_get(variable)         # to an instance variable
    value += 1                                      # increment
    instance_variable_set(variable, value)          # and reset the instance variable
  end

  def print_analytics
    analytics = ''

    ValidWeapon::WEAPONS.each do |choice|
      frequency = instance_variable_get("@#{choice.downcase}")
      analytics += <<-TEXT
  #{choice}: Used #{frequency} times (#{calc_percentage(frequency)}%)
      TEXT
    end

    analytics
  end

  def to_s
    stats = <<-STATS
  Total Games:    #{total_games}
  Wins:           #{self.wins}
  Loses:          #{self.loses}
  Ties:           #{self.ties}
  Win Percentage: #{win_percentage}
    STATS

    stats
  end
end

class History
  attr_reader :rounds

  def initialize
    @rounds = []
  end

  def last_ten
    last_ten = []
    @rounds.first(10).each do |round|
      last_ten << "#{round.id}: You #{round.game_result} - Player: #{round.player_move} Computer: #{round.computer_move}"
    end

    last_ten.join("\n")
  end
end

class Round
  include Utilities

  @@num_rounds = 0

  attr_accessor :player_move, :computer_move, :game_result
  attr_reader :id

  def initialize
    @@num_rounds += 1
    @id = @@num_rounds
  end

  def win?
    player_move.beats?(computer_move.class)
  end

  def lose?
    computer_move.beats?(player_move.class)
  end

  def tie?
    player_move.class == computer_move.class
  end

  def result(player, computer)
    if win?
      player.stats.winner!
      computer.stats.loser!
      return :win
    elsif lose?
      player.stats.loser!
      computer.stats.winner!
      return :lose
    elsif tie?
      player.stats.tied!
      computer.stats.tied!
      return :tie
    end
  end

  def result_message
    result_msg =  case game_result
                  when :win
                    msg = 'Winner!'.center(40)
                    msg.yellow.on_green.bold
                  when :lose
                    msg = "You've lost this round :(".center(40)
                    msg.yellow.on_red.bold
                  when :tie
                    msg = "It's a tie!".center(40)
                    msg.red.on_light_yellow.bold
                  end

    result_msg
  end

  def victory_msg
    victory_msg = case game_result
                  when :win
                    msg = "#{player_move} #{player_move.victor_verb(computer_move)} #{computer_move}".center(40)
                    msg.yellow.on_green.bold
                  when :lose
                    msg = "#{computer_move} #{computer_move.victor_verb(player_move)} #{player_move}".center(40)
                    msg.yellow.on_red.bold
                  end

    victory_msg
  end
end

class Game
  include Utilities

  attr_reader :player, :computer, :history

  def initialize
    @player = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def play
    @round = Round.new

    puts "#{player} vs. #{computer}".cyan

    @round.player_move = player.choose_move
    @round.computer_move = computer.choose_move

    puts "#{player.name}: #{@round.player_move}".green
    puts "#{computer.name}: #{@round.computer_move}".green

    @round.game_result = @round.result(player, computer)
    update_history

    puts @round.victory_msg
    puts @round.result_message
    puts player.stats
  end

  def analyze
    players = [player, computer]

    players.each do |plyr|
      puts plyr.name
      puts plyr.stats
      puts plyr.stats.print_analytics
      puts "#{'-' * 30}"
    end
  end

  def print_last_ten
    puts history.last_ten
  end

  private

  def update_history
    history.rounds.unshift @round
  end
end

def prompt(message)
  puts message
  print '=> '
end

game = Game.new
system 'clear'
game.play

loop do
  prompt('[Enter] to continue, exit to quit, h for last ten games, a to show analytics')
  continue = gets.chomp.downcase

  system 'clear'

  if continue == 'h'
    game.print_last_ten
  elsif continue == 'a'
    game.analyze
  elsif continue == 'exit'
    break
  else
    game.play
  end
end

game.analyze
puts "Thanks for playing!"