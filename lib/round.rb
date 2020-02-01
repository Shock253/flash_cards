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

    @current_card_index += 1
    new_turn
  end

  def number_correct_by_category(category)
    correct_in_category = 0
    @turns.each do |turn|
      if turn.correct? and turn.card.category == category
        correct_in_category += 1
      end
    end
    correct_in_category
  end

  def percent_correct
    (@number_correct.to_f / turns.length.to_f) * 100.0
  end

end
