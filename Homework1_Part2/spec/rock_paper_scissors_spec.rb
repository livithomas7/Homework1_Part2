require 'rock_paper_scissors'
require 'byebug'


describe RockPaperScissors do
  before(:each) do
    @rock = ['Armando','R'] ; @paper = ['Dave','P'] ; @scissors = ['Sam','S']
  end
  describe 'game' do
    it 'rock breaks scissors' do
      expect(RockPaperScissors.winner(@rock, @scissors)).to eq(@rock)
    end
    it 'scissors cut paper' do
      expect(RockPaperScissors.winner(@paper, @scissors)).to eq(@scissors)
    end
    it 'paper covers rock' do
      expect(RockPaperScissors.winner(@rock, @paper)).to eq(@paper)
    end
    it 'first player wins if both use same strategy' do
      expect(RockPaperScissors.winner(@scissors, ['Dave','S'])).to eq(@scissors)
    end
  end
  it "should raise NoSuchStrategyError if strategy isn't R, P, or S" do
    expect(lambda { RockPaperScissors.winner(@rock, ['Dave', 'w']) }).to raise_error(RockPaperScissors::NoSuchStrategyError, "Strategy must be one of R,P,S")
  end
  describe 'tournament' do
    it 'base case' do
      expect(RockPaperScissors.tournament_winner([@rock,@paper])).to eq(@paper)
    end
    it 'recursive case' do
      tourney = [
        [
          [ ["Armando", "P"], ["Dave", "S"] ],      
          [ ["Richard", "R"], ["Michael", "S"] ]
        ],
        [
          [ ["Allen", "S"], ["Omer", "P"] ],
          [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
      ]
      expect(RockPaperScissors.tournament_winner(tourney)).to eq(['Richard', 'R'])
    end
  end
    describe 'tournament' do
      it 'recursive case' do
        tourney = [
          [
            [ ['Armando','R'], ['Dave','P'] ],      
            [ ['Sam','S'], ["Bob", "R"] ]
          ],
          [
            [ ["Katy", "P"], ["Brian", "S"] ],
            [ ["Lily", "R"], ["Billy", "S"] ]
          ]
        ]
        expect(RockPaperScissors.tournament_winner(tourney)).to eq(['Dave','P'])
      end
  end
end