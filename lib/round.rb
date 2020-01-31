require "./lib/deck"


class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@current_card_index]
  end

  def take_turn(user_answer)
    new_turn = Turn.new(user_answer, @deck.cards[@current_card_index])
    @turns << new_turn
    if new_turn.correct?
      @number_correct += 1
    end

    new_turn
  end
end
