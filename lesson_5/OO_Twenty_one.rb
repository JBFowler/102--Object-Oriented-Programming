# Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

# Here is an overview of the game:
# - Both participants are initially dealt 2 cards from a 52-card deck.
# - The player takes the first turn, and can "hit" or "stay".
# - If the player busts, he loses. If he stays, it's the dealer's turn.
# - The dealer must hit until his cards add up to at least 17.
# - If he busts, the player wins. If both player and dealer stays, then the highest total wins.

# Nouns: card, player, dealer, participant, deck, game, total
# Verbs: deal, hit, stay, busts

# Player
# - hit
# - stay
# - busted?
# - total
# Dealer
# - hit
# - stay
# - busted?
# - total
# - deal (should this be here, or in Deck?)
# Participant
# Deck
# - deal (should this be here, or in Dealer?)
# Card
# Game
# - start

require 'pry'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end

    mix_cards!
  end

  def mix_cards!
    cards.shuffle!
  end

  def deal_a_card
    cards.pop
  end
end

class Card
  SUITS = %w(H D C S)
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}."
  end

  def value
    case @value
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @value
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'C' then 'Clubs'
    when 'S' then 'Spades'
    end
  end

  def ace?
    value == 'Ace'
  end

  def king?
    value == 'King'
  end

  def queen?
    value == 'Queen'
  end
  
  def jack?
    value == 'Jack'
  end
end

module Hand
  def take_card(card_from_deck)
    cards << card_from_deck
  end

  def total
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.value.to_i
      end
    end
    # correct for Aces
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def show_hand
    puts "#{name}'s cards:".center(60, '-')
    cards.each do |card|
      puts "#{card}".center(60)
    end
    puts "Total: #{total}".center(60)
  end

  def busted?
    total > 21
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards
  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Please enter a name, cannot leave blank."
    end
    self.name = name
  end

  def show_flop
    show_hand
  end

  def hit
    
  end

  def stay
    
  end

end

class Dealer < Participant
  HERO = ['Arthas', 'Master Chief', 'Obi Won', 'Baymax', 'Voldemort', 'Bruce Wayne']

  def set_name
    self.name = HERO.sample
  end

  def show_flop
    puts "#{name}'s cards:".center(60, '-')
    puts "#{cards.first}".center(60)
    puts "Second card is hidden until dealer's turn.".center(60)
    puts "".center(60, "-")
  end

  def seventeen?
    total >= 17
  end

end

class TwentyOneGame
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def welcome_player
    puts "Welcome to 21 #{player.name}."
  end

  def busted_message
    if player.busted?
      puts "I'm sorry you busted!  #{dealer.name} wins..."
    elsif dealer.busted?
      puts "#{dealer.name} busted, you win!!!"
    end 
  end

  def goodbye_message
    puts "Thanks for playing 21!"
  end

  def deal_cards
    2.times do
      player.take_card(deck.deal_a_card)
      dealer.take_card(deck.deal_a_card)
    end
  end

  def show_initial_cards
    player.show_flop
    dealer.show_flop
  end

  def show_cards
    puts ""
    player.show_hand
    dealer.show_hand
    puts ""
  end

  def player_turn
    loop do
      puts "Would #{player.name} like to hit or stay? (h/s)"
      answer = nil
      loop do
        answer = gets.chomp
        break if ['h', 's'].include?(answer)
        puts "You must enter 'h' or 's'."
      end

      if answer == 's'
        puts "You selected to stay."
        break
      else
        player.take_card(deck.deal_a_card)
        puts "You selected to hit!"
        player.show_hand
        break if player.busted?
      end
    end
  end

  def dealer_turn
    puts "#{dealer.name} will now go."
    loop do
      dealer.show_hand
      if dealer.busted? || dealer.seventeen?
        break
      else
        dealer.take_card(deck.deal_a_card)
        puts "#{dealer.name} takes card."
      end
    end
  end

  def show_result
    if player.total > dealer.total
      puts "Congrats, you win!"
    elsif dealer.total > player.total
      puts "Bummer, #{dealer.name} wins..."
    else
      puts "It's a tie!"
    end 
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp
    answer.start_with? 'y'
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def start
    loop do
      welcome_player
      deal_cards
      show_initial_cards
      player_turn
      if player.busted?
        busted_message
        if play_again?
          reset
          next
        else
          goodbye_message
          break
        end
      end
      dealer_turn
      if dealer.busted?
        busted_message
        if play_again?
          reset
          next
        else
          break
        end
      end

      show_cards
      show_result
      play_again? ? reset : break
    end

    goodbye_message
  end
end

TwentyOneGame.new.start