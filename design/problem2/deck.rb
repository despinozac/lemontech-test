require_relative 'card'

class Deck

  STD_RANKS = (2..10).to_a
  SPECIAL_RANKS = {jack: 11, reina: 12, rey: 13, as: 14} 
  SUITS =  %w(Picas Trebol Corazones Diamantes)

  attr_accessor :deck

  def initialize

    @deck = Array.new
    
    STD_RANKS.concat(SPECIAL_RANKS.to_a).product(SUITS).each do |arr|
      @deck.push(Card.new("", arr.first, arr.last))
    end
  end

  def size
    self.deck.size
  end

  def shuffle_deck
    self.deck.shuffle!
  end

  def deal_top
    self.deck.shift  
  end

  def deal_bottom
    self.deck.pop
  end

  def cut
    self.deck.concat(self.deck.slice!(0, self.size))
  end
end