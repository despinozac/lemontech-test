class Card

  include Comparable

  attr_accessor :color ,:rank, :suit

  def initialize(color= "", rank = "", suit= "")
    @color = color
    @rank = rank.is_a?(Array) ? rank.first.to_s.capitalize : rank 
    @suit = suit
    @value = rank.is_a?(Array) ? rank.last : rank
  end

  def to_s
    "#{rank} de #{suit} color: #{color}"
  end

  def <=>(card)
    @value <=> card.to_i
  end
end