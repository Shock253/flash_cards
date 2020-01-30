class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    cards_for_category = []
    @cards.each do |card|
      if card.category == category
        cards_for_category << card
      end
    end

    cards_for_category
  end

end
