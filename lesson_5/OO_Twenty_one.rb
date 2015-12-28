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

class Player
  def initialize
    
  end

  def hit
    
  end

  def stay
    
  end

  def busted?
    
  end

  def total
    
  end
end

class Dealer
  def initialize
    
  end

  def deal
    
  end

  def hit
    
  end

  def stay
    
  end

  def busted?
    
  end

  def total
    
  end
end

class Participant
  
end

class Deck
  def initialize
    
  end

  def deal
    
  end
end

class Card
  def initialize
    
  end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start