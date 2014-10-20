require_relative 'card.rb'
#require_relative 'CardError.rb'

class Deck
  def self.all_cards(n = 1)
    deck = []
    n.times do
      Card::VALUE_STRINGS.each do |sym, str|
        Card::SUIT_STRINGS.each do |suit, char|
          deck << Card.new(suit, sym)
        end
      end
    end
    deck
  end
  
  def initialize(n = 1)
    @cards = Deck.all_cards(n)
  end
  
  def take(n)
    raise CardError.new "not enough cards" if n > @cards.count
    @cards.shift(n)
  end
  
  def top
    @cards.shift
  end
  
  def shuffle!
    @cards.shuffle!
  end
end