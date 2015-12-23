# Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
# marking a square. The first player to mark 3 squares in a row wins.

# Nouns: board, player, square, grid
# Verbs: play, mark

# Board
# Square
# Player
# - mark
# - play

class Board
  def initialize
    
  end
  
end

class Square
  def initialize
    
  end
end

class Player
  def initialize
    
  end

  def mark
    
  end
end

class TTTGame
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def display_board
    prints_board = <<-BOARD
         |     |     
         |     |     
         |     |     
    -----+-----+-----
         |     |     
         |     |     
         |     |     
    -----+-----+-----
         |     |     
         |     |     
         |     |     
         
  BOARD
  puts prints_board
  end

  def play
    display_welcome_message
    loop do
      display_board
      break
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play