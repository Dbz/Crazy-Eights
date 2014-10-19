require_relative 'card.rb'
require_relative 'deck.rb'

class Hand
  attr_accessor :cards
  
  def self.deal_from(deck)
    Hand.new(deck.take(8))
  end
  
  def initialize(cards)
    @cards = cards
  end
  
  def options(top_card)
    cards = []
    @cards.each do |c|
      cards << c if c.suit == top_card.suit || c.eights_value == top_card.eights_value || c.eights_value == 8
    end
    cards
  end
  
  def display(cards)
    str = ""
    cards.each_with_index do |card, i|
      str += "(#{i})|#{card.to_s}|"
    end
    puts str
  end
  
  def discard(deck, card)
    deck.return(card)
  end
  
  def return_cards(deck)
    @cards.count.times { deck.return(card.shift) }
  end
  
end