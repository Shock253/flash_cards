class Card
  attr_accessor :answer, :question, :category

  def initialize(question, answer, category)
    @answer = answer
    @question = question
    @category = category
  end
end
