require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def test_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_has_attributes
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal deck, round.deck
    assert_equal [], round.turns
  end

  def test_can_return_current_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal deck.cards[0], round.current_card
  end

  def test_can_take_turn
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)


    new_turn1 = round.take_turn("Juneau")


    assert_instance_of Turn, new_turn1
    assert_equal [new_turn1], round.turns
    assert_equal true, new_turn1.correct?
    assert_equal 1, round.number_correct
    assert_equal deck.cards[1], round.current_card

    new_turn2 = round.take_turn("Venus")

    assert_instance_of Turn, new_turn2
    assert_equal [new_turn1, new_turn2], round.turns
    assert_equal false, new_turn2.correct?
    assert_equal 2, round.turns.count
    assert_equal "Incorrect.", round.turns.last.feedback
    assert_equal deck.cards[2], round.current_card
    assert_equal 1, round.number_correct
  end

  def test_calculates_number_correct_by_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)


    new_turn1 = round.take_turn("Juneau")
    new_turn2 = round.take_turn("Venus")

    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_calculates_percent_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)


    new_turn1 = round.take_turn("Juneau")
    new_turn2 = round.take_turn("Venus")


    assert_equal 50.0, round.percent_correct

  end

  def test_calculates_percent_correct_by_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)


    new_turn1 = round.take_turn("Juneau")
    new_turn2 = round.take_turn("Venus")

    assert_equal 100.0, round.percent_correct_by_category(:Geography)
    assert_equal 0.0, round.percent_correct_by_category(:STEM)
  end
end
