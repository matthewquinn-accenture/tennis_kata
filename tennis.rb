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
    elsif is_deuce?
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

  def is_deuce?
    enough_for_deuce?(@player1) && check_tie?
  end

  def enough_for_deuce?(player)
    player >= 3
  end

  def check_tie?
    @player1 == @player2
  end

  def check_advantage?
    enough_for_deuce?(@player1) && enough_for_deuce?(@player2) && (score_difference == 1)
  end

  def score_difference
    (@player1 - @player2).abs
  end

  def check_winner?
    (enough_for_win?(@player1) || enough_for_win?(@player2)) && (score_difference >= 2)
  end

  def enough_for_win?(player)
    player > 3
  end

  def player_leading
    @player1 < @player2 ? "Player 2" : "Player 1"
  end

  def player_tie
    @possible_scores[@player1] + " all"
  end

  def player_score
    @possible_scores[@player1] + " - " + @possible_scores[@player2]
  end
end
