require "./lib/deck"


class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
  end

  def current_card
    @deck.cards[@current_card_index]
  end
end
