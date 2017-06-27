require_relative "../tennis"

describe "Initial test" do
  it "true is true" do
      expect(true).to eq(true)
  end
end


describe "Tennis scoring game" do
  before(:each) do
    @tennis_game = Game.new
  end

  it "initial score displays love all" do
    expect(@tennis_game.score).to eq("love all")
  end

  it "Player Two Scores && Player One Scores" do
    @tennis_game.player2 = 1
    @tennis_game.player1 = 1
    expect(@tennis_game.score).to eq("15 all")
  end

  it "Player One Scores" do
    @tennis_game.player1 = 1
    expect(@tennis_game.score).to eq("15 - love")
  end

  it "Player One Scores Twice && Player Two Scores Once" do
    @tennis_game.player1 = 2
    @tennis_game.player2 = 1
    expect(@tennis_game.score).to eq("30 - 15")
  end

  it "Player One Scores Twice && Player Two Scores Twice" do
    @tennis_game.player1 = 2
    @tennis_game.player2 = 2
    expect(@tennis_game.score).to eq("30 all")
  end

  it "Player Two Scores 3 times && Player One Scores Once" do
    @tennis_game.player1 = 1
    @tennis_game.player2 = 3
    expect(@tennis_game.score).to eq("15 - 40")
  end

end
