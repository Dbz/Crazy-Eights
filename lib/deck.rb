require_relative 'card.rb'

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
  
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end
  
  def take(n)
    raise "not enough cards" if n > @cards.count
    @cards.shift(n)
  end
  
  def return(card)
    @cards = [card] + @cards
  end
  
  def top
    @cards.first
  end
  
  def shuffle!
    @cards.shuffle!
  end
end