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
      player_leading + " wins"
    elsif isDeuce?
      "deuce"
    elsif check_advantage?
       player_leading + " advantage"
    elsif check_tie?
      player_tie
    else
      player_score
    end
  end

  private

  def isDeuce?
    @player1 >= 3 && check_tie?
  end

  def check_advantage?
    had_deuce? && (score_difference == 1)
  end

  def had_deuce?
    @player1 >= 3 && @player2 >= 3
  end

  def player_leading
    @player1 < @player2 ? "Player 2" : "Player 1"
  end

  def check_winner?
    (scored_enough?(@player1) || scored_enough?(@player2)) && (score_difference >= 2)
  end

  def scored_enough?(player)
    player > 3
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

  def score_difference
     (@player1 - @player2).abs
  end
end
