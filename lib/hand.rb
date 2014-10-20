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
    @cards.each do |c| # Correct suit | Correct value | Eight | Joker
      cards << c if c.suit == top_card.suit || c.eights_value == top_card.eights_value || c.eights_value == 8 || c.eights_value == 1
    end
    cards = @cards if top_card.eights_value == 1 # Joker
    cards
  end
  
  def display(cards, numbers = true)
    str = ""
    cards.each_with_index do |card, i|
      str += "#{"(#{i.to_s})" if numbers}|#{card.to_s}|"
    end
    puts str
  end
  
end