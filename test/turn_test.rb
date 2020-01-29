require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    turn = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))

    assert_equal "Juneau", turn.guess
  end

  def test_it_has_a_card
    test_card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", test_card)

    assert_equal test_card, turn.card
  end

  def test_correct_returns_false
    turn = Turn.new("Denver", Card.new("What is the capital of Alaska?", "Juneau", :Geography))

    assert_equal false, turn.correct?
  end

  def test_correct_returns_true
    turn = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))

    assert_equal true, turn.correct?
  end

  def test_it_marks_wrong
    turn = Turn.new("Denver", Card.new("What is the capital of Alaska?", "Juneau", :Geography))

    assert_equal "Incorrect.", turn.feedback
  end

  def test_it_marks_correct
    turn = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))

    assert_equal "Correct!", turn.feedback
  end

end
