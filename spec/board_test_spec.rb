require './board'
RSpec.describe "Game" do
  # describe "#build" do
  #   # it "Creates the board for the game" do
  #   #   game = Game.new
  #   #   game.build
  #   #   expect(game.build).to be_kind_of(Matrix)
  #   # end
  # end
  describe "#read" do
  it "Reads what is inside of the Game" do
    game = Game.new
    game.build
    game.read
    expect(game.read)
  end
  it "Tells you if the cell is death" do
    game = Game.new
    game.build
    next_stage = [[0,1,1,1],
                  [0,0,0,0],
                  [1,0,0,0],
                  [0,0,1,1]]
    game.read
    expect(game.build).to be_kind_of(Array)
  end
  end
end


    # next_stage = [[0,1,1,0],
    #               [1,0,1,1],
    #               [1,0,1,1],
    #               [1,0,1,1]]
