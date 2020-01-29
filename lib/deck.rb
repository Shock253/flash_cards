class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    out = []
    @cards.each {|card|
      if card.category == category
        out << card
      end
    }
    out
  end

end