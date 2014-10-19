require 'hand.rb'

class Player
  def initialize(hand)
    @hand = hand
  end
  
  def choose_card(deck, top_card)
    puts "The top card is #{deck.top.to_s}"
    while @hand.options(top_card).empty?
      puts "You have no choice but to draw!"
      @hand.cards += deck.take(1)
      @hand.display(@hand.cards)
    end
    
    print "Your choices are: "
    options = @hand.options(top_card)
    @hand.display(options)
    puts "Please type the number of the card that you would like to play"
    input = gets.chomp.to_i
    card = options[input]
    @hand.cards.delete(card)
    
    card
    
  end
  
  def cards
    @hand.cards.count
  end
end

