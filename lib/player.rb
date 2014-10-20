# require_relative 'hand.rb'
require_relative 'card.rb'

class CardError < TypeError
end

class Player
  attr_accessor :hand

  def choose_card(deck, top_card)
    puts "The top card is #{top_card.to_s}"
    print "Your hand is "
    @hand.display(@hand.cards)
    
    begin
      while @hand.options(top_card).empty?
        puts "You have no choice but to draw!"
        @hand.cards += deck.take(1)
      end
    rescue "not enough cards"
      puts "There are no more cards in the deck, so you have to pass!"
      return top_card
    end
    
    print "Your choices are: "
    options = @hand.options(top_card)
    @hand.display(options)
    puts "Please type the number of the card that you would like to play"
    input = gets.chomp.to_i
    card = options[input]
    @hand.cards.delete(card)
    
    if card.eights_value == 8
      begin
        puts "Please choose the suit: #{Card.suits.map(&:to_s)}"
        input = gets.chomp.downcase.to_sym
        raise CardError.new "Not valid input" if Card.suits.map(&:to_s).include? input
        card = Card.new(input.to_sym, card.value)
      rescue CardError => e
        retry
      end
    end
       
    card
  end

  def cards
    @hand.cards.count
  end
end

