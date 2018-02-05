class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  class WrongNumberOfPlayersError < StandardError ; end

  def self.winner(player1, player2)
    player1_choice = player1[1]
    player2_choice = player2[1]
    
    validate_strategy player1_choice
    validate_strategy player2_choice
    
    if player1_choice == 'R'
      return player2 if player2_choice == 'P'
    elsif player1_choice == 'P'
      return player2 if player2_choice == 'S'
    else
      return player2 if player2_choice == 'R'
    end
    player1
  end
  
  def self.tournament_winner(tournament)
    p1, p2 = tournament
    return self.winner(p1,p2) if p1[0].class == String
    p1 = self.tournament_winner(p1)
    p2 = self.tournament_winner(p2)
    self.tournament_winner([p1, p2])
    
  end

  def self.validate_strategy(strategy)
    raise NoSuchStrategyError.new('Strategy must be one of R,P,S') unless strategy.match (/[PRS]/) 
  end
end

