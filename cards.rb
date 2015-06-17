class Card
  SUITS = %i[hearts clubs diamonds spades]
  RANKS = %i[ace two three four five six seven eight nine ten jack queen king]

  attr_reader :suit, :rank

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def eql?(other)
    to_s == other.to_s
  end
  alias_method :==, :eql?

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_reader :cards

  def initialize(shoe_size=1)
    @cards = (build_deck * shoe_size).shuffle
  end

  def to_a
    cards
  end

private

  def build_deck
    Card::RANKS.flat_map {|rank| Card::SUITS.map {|suit| Card.new(rank, suit) }}
  end
end

