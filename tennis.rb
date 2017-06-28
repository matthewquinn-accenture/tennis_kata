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
    if check_winner?
      player_winner
    elsif isDeuce?
      "deuce"
    elsif check_advantage?
       player_advantage
    elsif check_tie?
      player_tie
    else
      player_score
    end
  end

  private
  def isDeuce?
    @player1 >= 3 && (@player1 == @player2)
  end

  def check_advantage?
    @player1 >= 3 && @player2 >= 3 && (@player1 - @player2).abs == 1
  end

  def player_advantage
    @player1 > @player2 ? "Player 1 advantage" : "Player 2 advantage"
  end

  def check_winner?
    (@player1 > 3 || @player2 > 3) && ((@player1 - @player2).abs >= 2)
  end

  def player_winner
    @player1 < @player2 ? "Player 2 wins" : "Player 1 wins"
  end

  def check_tie?
    @player1 == @player2
  end

  def player_tie
    @possible_scores[@player1] + " all"
  end

  def player_score
    @possible_scores[@player1] + " - " + @possible_scores[@player2]
  end

end
