class Turn
  attr_accessor :user_answer, :card

  def initialize(user_answer, card)
    @user_answer = user_answer
    @card = card
  end

  def guess
    return @user_answer
  end

  def card
    return @card
  end

  def correct?
    return (@card.answer == user_answer)
  end

  def feedback
    if self.correct?
      return "Correct!"
    else
      return "Incorrect."
    end
  end
  
end
