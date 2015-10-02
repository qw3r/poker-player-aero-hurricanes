require 'logger'


class Player

  VERSION = "Default Ruby folding player"
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_reader :game_state



  def initialize(game_state)
    @game_state = game_state
    @logger = Logger.new $stdout
  end



  def bet_request
    @logger.info game_state.inspect

    buy_in = game_state.current_buy_in
    small_blind = game_state.small_blind
    
    return game_state.allin if game_state.has_pair?
    return buy_in if (2 * small_blind >= buy_in)
    0
  end



  def showdown

  end
end
