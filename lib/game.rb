#require_relative 'card.rb'

require_relative 'deck.rb'
require_relative 'hand.rb'
require_relative 'player.rb'


class Game
  def initialize(players)
    @players = players
    if @players.count > 5
      @deck = Deck.new(2)
    else
      @deck = Deck.new
    end
  end
  
  def play
    @deck.shuffle!
    @players.each { |player| player.hand = Hand.new(@deck.take(8)) }
    @top_card = @deck.top
    until game_over?
      player = @players.shift
      puts "Hello, #{player.name}, it is your turn"
      @top_card = player.choose_card(@deck, top_card)
      @players << player
    end
  end
  
  def game_over?
    @players.any? { |player| player.hand.cards.empty? } || @players.all? { |player| player.hand.options(@top_card).empty? }
  end
  
end

game = Game.new([Player.new("Bert"), Player.new("Ernie")])
game.play