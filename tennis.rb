class Game
  attr_accessor :player1, :player2

  def initialize
     @player1 = 0
     @player2 = 0
     @possible_scores = {
       0 => "love",
       1 => "15",
       2 => "30",
       3 => "40"
     }
  end


  def score
    if @player1 == @player2
      @possible_scores[@player1] + " all"
    else
      @possible_scores[@player1] + " - " + @possible_scores[@player2]
    end
  end

end
