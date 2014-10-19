# require_relative 'hand.rb'
# require_relative 'card.rb'

class Player
  attr_accessor :hand

  def choose_card(deck, top_card)
    puts "The top card is #{top_card.to_s}"
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

