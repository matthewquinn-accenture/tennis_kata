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
    if @player1 >= 3 && (@player1 == @player2)
      "deuce"
    elsif @player1 >= 3 && @player2 >= 3 && (@player1 - @player2).abs == 1
      if @player1 > @player2
        "Player 1 advantage"
      elsif @player2 > @player1
        "Player 2 advantage"
      end
    elsif (@player1 > 3 || @player2 > 3) && ((@player1 - @player2).abs == 2)
      if @player1 < @player2
        "Player 2 wins"
      elsif @player2 < @player1
        "Player 1 wins"
      end

    elsif @player1 == @player2
      @possible_scores[@player1] + " all"
    else
      @possible_scores[@player1] + " - " + @possible_scores[@player2]
    end
  end
end
