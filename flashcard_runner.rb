require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

card1 = Card.new(
  "What is the capital of Alaska?",
   "Juneau",
   :Geography)
card2 = Card.new(
  "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
  "Mars",
  :STEM)
card3 = Card.new(
  "Describe in words the exact direction that is 697.5° clockwise from due north?",
  "North north west",
  :STEM)
card4 = Card.new(
  "What book was Marco Polo best known for?",
  "The Travels of Marco Polo",
  :History)

categories = [:Geography, :STEM, :History]
deck = Deck.new([card1, card2, card3, card4])
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.length} cards."
puts "-------------------------------------------------"

def start (round, categories)
  round.deck.cards.each do |card|
    puts "This is card number #{round.current_card_index + 1} out of #{round.deck.cards.length}"
    puts "Question: #{round.current_card.question}"
    user_response = gets.chomp
    round.take_turn(user_response)
    puts "#{round.turns.last.feedback}"
  end

  puts "****** Game over! ******"

  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.length} for a total score of #{round.percent_correct}"

  categories.each do |category|
    puts "#{category.to_s} - #{round.percent_correct_by_category(category).to_i}% correct"
  end
end

start(round, categories)


# Notes for Improvement:
# Add .categories method to round
